require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get facebook" do
    get :facebook
    assert_response :success
  end

  test "should get github" do
    get :github
    assert_response :success
  end

end
