class User < ActiveRecord::Base
  has_many :cards_users
  has_many :cards, through: :cards_users
end
