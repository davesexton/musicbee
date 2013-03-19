class Product < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :format_products
  has_many :formats, :through => :format_products
  has_many :songs

  validates :title, :description, presence: true
  validates :title, uniqueness: true


  def song_sample
    s = songs.sample(3).map {|s| s.title }.join("', '")
    "'#{s}'"
  end

  def image_url
    "/images/covers/#{id}.jpg"
  end

  def song_count
    songs.count
  end

end
