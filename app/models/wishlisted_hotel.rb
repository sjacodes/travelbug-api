class WishlistedHotel < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  has_many :users_checklisted_items
  has_many :checklist_items, through: :users_checklisted_items

  def create_checklist_items(prechecked_items = nil)
    if prechecked_items
      prechecked_items.each do |prechecked_item|
        UsersChecklistedItem.create(
          wishlisted_hotel: self, 
          checklist_item: ChecklistItem.find_by(lineitem: prechecked_item['content']), 
          checked: prechecked_item['checked']
          )
      end
    else
      ChecklistItem.all.each do |checklist_item|
        UsersChecklistedItem.create(wishlisted_hotel: self, checklist_item: checklist_item, checked: false)
      end
    end
  end



  def update_checklist(checklist_items)

    # params[:checklist_items] = [
    #   {id: 3, checked: true},
    #   {id: 6, checked: true},
    #   {id: 4, checked: true},
    #   {id: 5, checked: false}
    # ]

    checklist_items.each do |checklist_item|
      item = UsersChecklistedItem.find(checklist_item[:id])
      item.update(checked: checklist_item[:checked])
    end
  end

end
