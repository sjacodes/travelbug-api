class WishlistedHotel < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  has_many :users_checklisted_items
  has_many :checklist_items, through: :users_checklisted_items

  def create_checklist_items
    ChecklistItem.all.each do |checklist_item|
      UsersChecklistedItem.create(wishlisted_hotel: self, checklist_item: checklist_item, checked: false)
    end
  end
end
