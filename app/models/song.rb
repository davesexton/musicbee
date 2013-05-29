class Song < ActiveRecord::Base
  attr_accessible :description, :product_id, :title

  belongs_to :product

  validates :title, presence: true

  def title
    read_attribute(:title).upcase
  end

end
