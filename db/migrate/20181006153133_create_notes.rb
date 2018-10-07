class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :text
      t.belongs_to :blade

      t.timestamps
    end
  end
end
