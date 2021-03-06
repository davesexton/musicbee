class LineItemsController < ApplicationController
  # GET /line_items
  # GET /line_items.json

  #before_filter :set_cart, only: [:create]

  def index
    @line_items = LineItem.where('cart_id = ?', session[:cart_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    format_product = FormatProduct.find(params[:format_product_id])

    line_item = LineItem.where('cart_id = ? AND format_product_id = ?',
                               @cart.id, format_product.id).first

    if line_item
      @line_item = line_item
      @line_item.amount += 1
    else
      @line_item = LineItem.create(format_product_id: format_product.id,
                                   cart_id: @cart.id,
                                   price: format_product.price,
                                   amount: 1)
    end

    respond_to do |format|
      if @line_item.save
        @msg = "Added '#{@line_item.format_product.product.title}' to shopping cart"
        format.html { redirect_to root_url, notice: @msg }
        format.js
        format.json { render json: @line_item, status: :created,
                             location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    if @line_item.amount == 1
      @line_item.destroy
    else
      @line_item.amount -= 1
      @line_item.save
    end

    respond_to do |format|
      format.html { redirect_to cart_url }
      format.json { head :no_content }
    end
  end
end
