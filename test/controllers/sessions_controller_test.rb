require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new session for login path"do
    get login_path
    assert_template 'sessions/new'
    assert_response :success
  end
end
