class TransitionalController < ApplicationController

  skip_before_filter :authorize

  def index
  end

  def about
  end

  def samples
    @songs = Song.all.sample(10)
  end

  def contents
    @products = Product.all
  end

  def order
    @products = Product.all
    @order = Order.new
  end

  def order_confirmed

  end

  def contact
    @message = Message.new
  end
end
