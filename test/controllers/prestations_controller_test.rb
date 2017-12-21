require 'test_helper'

class PrestationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prestations_index_url
    assert_response :success
  end

  test "should get show" do
    get prestations_show_url
    assert_response :success
  end

  test "should get new" do
    get prestations_new_url
    assert_response :success
  end

  test "should get create" do
    get prestations_create_url
    assert_response :success
  end

end
