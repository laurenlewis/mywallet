class Card < ActiveRecord::Base
  has_many :cards_users, :class_name => 'CardsUser'
  has_many :users, through: :cards_users

  validates :card_number,
	 uniqueness: true
	 # format: {with: /\A(3[4,7][0-9]{13}|4([0-9]{12}|[0-9]{15})|6011[0-9]{12}|65[0-9]{14}|5[1-5]{1}[0-9]{14}|\b622(1(2[6-9][0-9]{10}|[3-9][0-9]{11})|[2-8][0-9]{12}|9([01][0-9]{11}|2[0-5][0-9]{10}))\b)\z/, message: "Enter a valid Amex, Visa, Discover, or Mastercard"}
end