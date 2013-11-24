class AddVatToFormatProducts < ActiveRecord::Migration
  def change
    add_column :format_products, :vat, :decimal
  end
end
