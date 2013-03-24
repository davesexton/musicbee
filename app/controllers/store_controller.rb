class StoreController < ApplicationController
  def index
    #@products = Product.all
    @format_products = FormatProduct.order('price DESC')
    @products = FormatProduct.order('price DESC, product_id').map{|fp| fp.product}
  end
end
