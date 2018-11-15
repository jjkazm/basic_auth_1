require 'test_helper'

class UsersLoginTest <ActionDispatch::IntegrationTest

  def setup
    @user = users(:agatka)
  end

  test 'failed login with incorrect credentials' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: {email: "invalid",
                                        password: "also_invalid"}}
    assert_select 'div#flash_display'
    assert_template 'sessions/new'
    get signup_path
    assert_select 'div#flash_display', false
  end

end
