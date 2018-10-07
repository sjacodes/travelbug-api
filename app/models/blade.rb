class Blade < ApplicationRecord
  belongs_to :wishlist
  has_one :hotel
  has_one :checklist
  has_one :note
end
