class FormatProduct < ActiveRecord::Base
  attr_accessible :format_id, :price, :product_id

  belongs_to :format
  belongs_to :product

end
