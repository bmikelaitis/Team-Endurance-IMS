class CreatePuroptions < ActiveRecord::Migration
  def change
    create_table :puroptions do |t|
    t.string :puroption_name
    t.text :description
    t.timestamps
    end
  end
end
