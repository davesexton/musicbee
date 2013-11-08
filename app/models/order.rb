class Order < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :address_line_3, :address_line_4, :comments, :email_address, :name, :post_code, :reference, :school_name, :telephone

  has_many :order_items
end
