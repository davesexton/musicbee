class StoreController < ApplicationController

  before_filter :set_cart
  skip_before_filter :authorize

  def index

    @format_products = FormatProduct.order('price DESC')
    @products = FormatProduct.order('price DESC, product_id').map{|fp| fp.product}
  end
end
