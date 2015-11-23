class CreatePurchasers < ActiveRecord::Migration
  def change
    create_table :purchasers do |t|
      t.string :purchaser_name
      t.string :worker_category
      t.timestamps
    end
  end
end
