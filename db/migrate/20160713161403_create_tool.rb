class CreateTool < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
    end
  end
end
