require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email:"example@examlpe.com", password:"pass123", password_confirmation: "pass123")
  end

  test "should be valid" do
    @user.save
    assert @user.valid?
  end
end
