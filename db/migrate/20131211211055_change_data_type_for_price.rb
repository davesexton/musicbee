class ChangeDataTypeForPrice < ActiveRecord::Migration
  def up
    change_column :order_items, :price, :decimal, {precision: 8, scale: 2}
  end

  def down
    change_column :order_items, :price, :decimal
  end
end
