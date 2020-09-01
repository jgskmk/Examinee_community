require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
   get user_create_path
   assert_no_difference 'User.count' do
     post users_path, params: { user: { name:  "",mail_address: "user@invalid",
       password:"foo", password_confirmation: "bar" } }
    end
      assert_template 'user/create'
  end


  test "valid signup information" do
  get user_create_path
  assert_difference 'User.count', 1 do
    post users_path, params: { user: { name:  "Example User", mail_address: "user@example.com",
        password: "password", password_confirmation: "password" } }
  end
  follow_redirect!
  assert_template 'user/login'
  end
end
