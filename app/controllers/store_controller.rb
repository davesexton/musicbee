class StoreController < ApplicationController

  before_filter :set_cart

  def index

    @format_products = FormatProduct.order('price DESC')
    @products = FormatProduct.order('price DESC, product_id').map{|fp| fp.product}
  end
end
