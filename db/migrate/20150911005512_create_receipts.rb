class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|

      t.datetime :date
      t.string :account_number, :university_id
      t.decimal :tax_amount, :purchase_amount, precision: 8, scale: 2
      t.boolean :approved, default: false
      t.text :descript
      t.integer :user_id, :subject_id, :purchaser_id, :puroption_id, :vendor_id, :department_id
      t.timestamps
    end
  end
end
