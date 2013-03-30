class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :format_product
      t.references :cart
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :amount

      t.timestamps
    end
    add_index :line_items, :format_product_id
    add_index :line_items, :cart_id
  end
end
