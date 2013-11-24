class AddVatToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :vat, :decimal
  end
end
