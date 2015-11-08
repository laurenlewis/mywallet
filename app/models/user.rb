class User < ActiveRecord::Base
  has_many :cards_users, :class_name => 'CardsUser'
  has_many :cards, through: :cards_users

  # Add a given card to this user
  def addCard(givenCard)
  	cards_users.create(card_id: givenCard.id)
  end
end