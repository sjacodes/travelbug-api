class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.boolean :within_price_range
      t.boolean :airport_transfer_available
      t.boolean :late_checkout_available
      t.boolean :offers_packages_and_deals
      t.belongs_to :blade

      t.timestamps
    end
  end
end
