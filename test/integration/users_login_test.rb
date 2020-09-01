require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
   @user = users(:michael)
  end

  test "login with invalid information" do
    get user_login_path
    assert_template 'user/login'
    post login_path, params: { session: { mail_address: "", password: "" } }
    assert_template 'user/login'
  end

  test "login with valid with information followed by logout" do
    get login_user_path
    assert_difference 'User.count', 1 do
    post users_path, params: { user: { name:  "Example User",
                                       mail_address: "user@example.com",
                                       password:              "password",
                                       password_confirmation: "password" } }
  end
    follow_redirect!
    assert_template 'home/top'
    assert is_logged_in?
    delete logout_path
    assert_not is_logged_in?
    assert_template 'home/top'
  end
end
