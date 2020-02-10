require 'test_helper'

class EndUsers::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get end_users_categories_show_url
    assert_response :success
  end

end
