class Card < ActiveRecord::Base
  has_many :cards_users
  has_many :users, through: :cards_users
end
