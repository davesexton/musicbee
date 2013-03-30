class LineItem < ActiveRecord::Base
  attr_accessible :format_product_id, :cart_id, :price, :amount

  belongs_to :format_product
  belongs_to :cart

end
