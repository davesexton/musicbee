class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_cart
  #before_filter :authorize

  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_target] = request.url

      if User.count.zero?
        user = User.create(name: params[:name],
                           password: params[:password],
                           password_confirmation: params[:password])
      end
      redirect_to login_url, notice: 'Please log in'
    end
  end

  def set_cart
    @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
  end
end
