class Card < ActiveRecord::Base
  has_many :cards_users, :class_name => 'CardsUser'
  has_many :users, through: :cards_users

  validates :card_number,
	 uniqueness: true,
	 presence: true,
	 format: {with: /\A(3[4,7][0-9]{13}|4([0-9]{12}|[0-9]{15})|6011[0-9]{12}|65[0-9]{14}|5[1-5]{1}[0-9]{14}|\b622(1(2[6-9][0-9]{10}|[3-9][0-9]{11})|[2-8][0-9]{12}|9([01][0-9]{11}|2[0-5][0-9]{10}))\b)\z/, message: "Enter a valid Amex, Visa, Discover, or Mastercard"}
  
  validates :expiration_month, presence: true
  validates :expiration_year, presence: true

  before_save :set_card_type

  def set_card_type
  	# If self.card_number starts with 44XX, set self.card_type to Visa
  	# Else if starts with... set to XXX?
  	# https://www.cybersource.com/developers/getting_started/test_and_manage/best_practices/card_type_id/
  	starts_with = self.card_number.to_s.chars.first
  	if starts_with == '4'
  		self.card_type = 'Visa'
  	elsif starts_with == '5'
  		self.card_type = 'Mastercard'
  	elsif starts_with == '6'
  		self.card_type = 'Discover'
	elsif starts_with == '3'
		self.card_type = 'American Express'
	else
		self.card_type = self.card_number
  	end
  end
end