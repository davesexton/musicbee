class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :school_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :address_line_4
      t.string :post_code
      t.string :email_address
      t.string :telephone
      t.string :reference
      t.text :comments

      t.timestamps
    end
  end
end
