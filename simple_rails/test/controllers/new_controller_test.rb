require 'test_helper'

class NewControllerTest < ActionController::TestCase
  test "should get head" do
    get :head
    assert_response :success
  end

end
