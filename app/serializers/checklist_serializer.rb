class ChecklistSerializer < ActiveModel::Serializer
  attributes :id, :within_price_range, :airport_transfer_available, :late_checkout_available, :offers_packages_and_deals
end
