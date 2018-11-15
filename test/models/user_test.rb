require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email:"example@examlpe.com", password:"pass123", password_confirmation: "pass123")
  end

  test "should be valid" do
    @user.save
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "password confirmation should be present" do
    @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "password confirmation should match password" do
    @user.password_confirmation = "different"
    assert_not @user.valid?
  end

  test "password confirmation should match password including case sensitivity" do
    @user.password_confirmation = "PASS123"
    assert_not @user.valid?
  end


  test "email should be unique" do
    @user.save
    @user2 = @user.dup
    assert_not @user2.valid?
  end

end
