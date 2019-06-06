require 'test_helper'

class FavoriteConvoyControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_convoy_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_convoy_destroy_url
    assert_response :success
  end

end
