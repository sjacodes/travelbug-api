class Hotel < ApplicationRecord
  has_many :users, through: :wishlistedhotels
  has_many :wishlistedhotels
end
