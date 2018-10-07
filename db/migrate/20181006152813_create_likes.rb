class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.belongs_to :wishlist
      t.belongs_to :hotel

      t.timestamps
    end
  end
end
