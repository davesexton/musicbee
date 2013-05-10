class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy

  def total_price
    line_items.sum{|li| li.total_price}
  end

  def total_items
    line_items.sum{|li| li.amount}
  end
end
