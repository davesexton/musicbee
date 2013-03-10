class Format < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :format_products
  has_many :products, :through => :format_products

  validates :title, :description, presence: true


end
