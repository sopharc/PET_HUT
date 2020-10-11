require 'test_helper'

class BlogPostControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get blog_post_Index_url
    assert_response :success
  end

end
