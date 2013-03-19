class Song < ActiveRecord::Base
  attr_accessible :description, :product_id, :title

  belongs_to :product

  validates :title, presence: true

end
