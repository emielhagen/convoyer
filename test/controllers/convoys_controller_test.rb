require 'test_helper'

class ConvoysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get convoys_index_url
    assert_response :success
  end

  test "should get show" do
    get convoys_show_url
    assert_response :success
  end

  test "should get new" do
    get convoys_new_url
    assert_response :success
  end

  test "should get create" do
    get convoys_create_url
    assert_response :success
  end

  test "should get destroy" do
    get convoys_destroy_url
    assert_response :success
  end

  test "should get update" do
    get convoys_update_url
    assert_response :success
  end

end
