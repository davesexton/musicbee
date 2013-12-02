class ChangeDataTypeForVat < ActiveRecord::Migration
  def up
    change_column :format_products, :vat, :decimal, {precision: 8, scale: 2}
    change_column :order_items, :vat, :decimal, {precision: 8, scale: 2}
  end

  def down
    change_column :format_products, :vat, :decimal
    change_column :order_items, :vat, :decimal
  end
end
