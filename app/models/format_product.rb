class FormatProduct < ActiveRecord::Base
  attr_accessible :format_id, :price, :product_id

  belongs_to :format
  belongs_to :product

  validates :price, numericality: {greater_than_or_equal_to: 0.01}


  def checked
    if FormatProduct.where(product_id: product_id).order('price DESC').first.id == id
      true
    else
      false
    end

  end

end
