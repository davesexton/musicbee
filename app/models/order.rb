class Order < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :address_line_3,
                  :address_line_4, :comments, :email_address, :name,
                  :post_code, :reference, :school_name, :telephone

  has_many :order_items
  accepts_nested_attributes_for :order_items

  def net_total
    order_items.sum(0){|i| i.net_total}
  end

  def gross_total
    order_items.sum(0){|i| i.gross_total}
  end

  def vat_total
    order_items.sum(0){|i| i.vat_total}
  end

end
