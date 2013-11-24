class FormatProduct < ActiveRecord::Base
  attr_accessible :format_id, :price, :product_id

  belongs_to :format
  belongs_to :product

  has_many :format_products
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  def gross_price
    price + vat
  end

  def checked
    if FormatProduct.where(product_id: product_id).order('price DESC').first.id == id
      true
    else
      false
    end

  end

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

end
