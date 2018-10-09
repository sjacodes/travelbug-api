class Hotel < ApplicationRecord
  has_many :users, through: :wishlisted_hotels
  has_many :wishlisted_hotels
end
