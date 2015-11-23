class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
    t.string :vendor_name
    t.text :description
    t.timestamps
    end
  end
end
