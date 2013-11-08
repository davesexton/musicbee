require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { address_line_1: @order.address_line_1, address_line_2: @order.address_line_2, address_line_3: @order.address_line_3, address_line_4: @order.address_line_4, comments: @order.comments, email_address: @order.email_address, name: @order.name, post_code: @order.post_code, reference: @order.reference, school_name: @order.school_name, telephone: @order.telephone }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    put :update, id: @order, order: { address_line_1: @order.address_line_1, address_line_2: @order.address_line_2, address_line_3: @order.address_line_3, address_line_4: @order.address_line_4, comments: @order.comments, email_address: @order.email_address, name: @order.name, post_code: @order.post_code, reference: @order.reference, school_name: @order.school_name, telephone: @order.telephone }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
