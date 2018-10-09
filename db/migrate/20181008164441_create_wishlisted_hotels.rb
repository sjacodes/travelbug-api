class CreateWishlistedHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlisted_hotels do |t|
      t.text :note
      t.belongs_to :user
      t.belongs_to :hotel

      t.timestamps
    end
  end
end
