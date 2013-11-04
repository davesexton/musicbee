require 'test_helper'

class TransitionalControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get samples" do
    get :samples
    assert_response :success
  end

  test "should get contents" do
    get :contents
    assert_response :success
  end

  test "should get order" do
    get :order
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
