class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :price, :quantity

  belongs_to :order

end
