class CardUser < ActiveRecord::Base
  belongs to :user 
  belongs to :card
end
