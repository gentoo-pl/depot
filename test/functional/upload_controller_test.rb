require 'test_helper'

class UploadControllerTest < ActionController::TestCase
  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get save" do
    get :save
    assert_response :success
  end

  test "should get picture" do
    get :picture
    assert_response :success
  end

end
