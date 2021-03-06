class User < ActiveRecord::Base
  has_many :cards_users, :class_name => 'CardsUser'
  has_many :cards, through: :cards_users

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, length: { minimum: 4,
    too_short: "must have at least 4 characters"}
  validates :phone, presence: true, format: {with: /\A\d{3}-\d{3}-\d{4}|\d{10}|\d{3}.\d{3}.\d{4}|\d{3}\s\d{3}\s\d{4}\z/, message: "Please enter a valid 10-digit phone number without any additional characters"}			    
  validates :fname, presence: true
  validates :lname, presence: true

  before_save :format_phone

  def format_phone
  	cleanup = self.phone.gsub(" ", "").gsub(".", "").gsub("-", "")
  	self.phone = cleanup
  end

  # Add a given card to this user
  def addCard(givenCard)
  	cards_users.create(card_id: givenCard.id, is_shared: false)
  end

  # Add a given card to this user
  def addSharedCard(givenCard)
  	cards_users.create(card_id: givenCard.id, is_shared: true)
  end

  # Get the cards the user owns
  def ownedCards
  	cus_owned_by_user = cards_users.where(is_shared: false)

  	# Have a list of CardsUsers, but want a list of Owned Cards
  	owned_cards = []
  	cus_owned_by_user.each do | cu |
  		card = Card.find(cu.card_id)
  		owned_cards.push(card)
  	end
  	owned_cards
  end

  # Get the cards the user had shared with them
  def sharedCards
  	cus_shared_with_user = cards_users.where(user_id: self.id, is_shared: true)

  	# Have a list of CardsUsers, but want a list of Shared Cards
  	shared_cards = []
  	cus_shared_with_user.each do | cu |
  		card = Card.find(cu.card_id)
  		shared_cards.push(card)
  	end
  	shared_cards
  end
end