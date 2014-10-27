require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get orders" do
    get :orders
    assert_response :success
  end

  test "should get order_complete" do
    get :order_complete
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
