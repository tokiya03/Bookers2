require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get groups_new_url
    assert_response :success
  end

  test "should get edit" do
    get groups_edit_url
    assert_response :success
  end

  test "should get show" do
    get groups_show_url
    assert_response :success
  end
end
