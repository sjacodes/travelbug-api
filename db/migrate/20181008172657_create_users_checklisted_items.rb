class CreateUsersChecklistedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :users_checklisted_items do |t|
      t.boolean :checked
      t.belongs_to :wishlisted_hotel

      t.timestamps
    end
  end
end
