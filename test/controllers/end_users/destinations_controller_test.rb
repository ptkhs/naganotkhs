require 'test_helper'

class EndUsers::DestinationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_destinations_index_url
    assert_response :success
  end

  test "should get update" do
    get end_users_destinations_update_url
    assert_response :success
  end

  test "should get edit" do
    get end_users_destinations_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get end_users_destinations_destroy_url
    assert_response :success
  end

end
