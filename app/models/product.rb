class Product < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :format_products
  has_many :formats, :through => :format_products
  has_many :songs

  #has_many :line_items
  #before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, presence: true
  validates :title, uniqueness: true

  def song_sample
    songs.sample(3)
  end

  def image_url
    "/images/covers/#{id}.jpg"
  end

  def song_count
    songs.count
  end

  def default_price_id
    format_products.order('price DESC').first.id
  end



end
