class WishlistedHotel < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  has_many :users_checklisted_items
  has_many :checklist_items, through: :users_checklisted_items
end
