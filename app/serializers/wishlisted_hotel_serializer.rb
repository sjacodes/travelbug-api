class WishlistedHotelSerializer < ActiveModel::Serializer
  attributes :id, :note, :hotel_id, :user_id, :imageurl, :checklist_items, :name, :city, :website

  def imageurl
    object.hotel.imageurl
  end

  def name
    object.hotel.name
  end

  def city
    object.hotel.city
  end

  def website
    object.hotel.website
  end

  def checklist_items
    object.users_checklisted_items.map do |item|
      {
        'id': item.id,
        'content': ChecklistItem.find(item.checklist_item.id).lineitem,
        'checked': item.checked
      }
    end
  end
end
