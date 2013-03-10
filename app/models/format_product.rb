class FormatProduct < ActiveRecord::Base
  attr_accessible :format_id, :price, :product_id

  belongs_to :format
  belongs_to :product

  #validates :title, :description, :image_url, presence: true


end
