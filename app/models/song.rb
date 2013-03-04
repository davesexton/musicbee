class Song < ActiveRecord::Base
  attr_accessible :description, :product_id, :title

  belongs_to :product

end
