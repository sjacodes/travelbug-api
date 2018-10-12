class UsersChecklistedItem < ApplicationRecord
  belongs_to :wishlisted_hotel
  belongs_to :checklist_item
end
