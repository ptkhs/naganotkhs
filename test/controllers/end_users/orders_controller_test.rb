require 'test_helper'

class EndUsers::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get confirm" do
    get end_users_orders_confirm_url
    assert_response :success
  end

  test "should get send" do
    get end_users_orders_send_url
    assert_response :success
  end

  test "should get new" do
    get end_users_orders_new_url
    assert_response :success
  end

  test "should get show" do
    get end_users_orders_show_url
    assert_response :success
  end

  test "should get thanks" do
    get end_users_orders_thanks_url
    assert_response :success
  end

  test "should get create" do
    get end_users_orders_create_url
    assert_response :success
  end

end
