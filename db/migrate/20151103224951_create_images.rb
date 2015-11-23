class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :file
      t.integer :receipt_id
      t.text :description
      t.timestamps
    end
  end
end
