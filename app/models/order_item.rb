class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :price, :vat, :quantity, :format_product_id

  belongs_to :order
  has_one :product, through: :format_product
  has_one :format, through: :format_product
  belongs_to :format_product

  def gross_price
    price + vat
  end

  def net_total
    price * quantity
  end

  def gross_total
    gross_price * quantity
  end

  def vat_total
    vat * quantity
  end

end
