class CreateFormatProducts < ActiveRecord::Migration
  def change
    create_table :format_products do |t|
      t.integer :product_id
      t.integer :format_id
      t.decimal :price

      t.timestamps
    end
  end
end
