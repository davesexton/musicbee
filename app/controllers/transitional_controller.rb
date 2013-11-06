class TransitionalController < ApplicationController
  def index
  end

  def about
  end

  def samples
    @songs = Song.all.sample(10)
  end

  def contents
  end

  def order
  end

  def contact
  end
end
