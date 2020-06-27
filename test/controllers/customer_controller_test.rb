require 'test_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_new_url
    assert_response :success
  end

  test "should get edit" do
    get customer_edit_url
    assert_response :success
  end

end
