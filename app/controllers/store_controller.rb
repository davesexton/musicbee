class StoreController < ApplicationController
  def index

    @format_products = FormatProduct.order('price DESC')
    @products = FormatProduct.order('price DESC, product_id').map{|fp| fp.product}
  end
end
