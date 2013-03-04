class Product < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :format_products
  has_many :formats, :through => :format_products
  has_many :songs

end
