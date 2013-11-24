class AddFormatProductIdToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :format_product_id, :integer
  end
end
