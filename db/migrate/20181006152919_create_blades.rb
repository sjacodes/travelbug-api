class CreateBlades < ActiveRecord::Migration[5.2]
  def change
    create_table :blades do |t|
      t.belongs_to :wishlist

      t.timestamps
    end
  end
end
