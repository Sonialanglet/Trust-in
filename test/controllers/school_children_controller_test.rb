require 'test_helper'

class SchoolChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get school_children_index_url
    assert_response :success
  end

end
