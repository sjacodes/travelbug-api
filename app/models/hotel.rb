class Hotel < ApplicationRecord
  has_many :users, through: :wishlists
end
