require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  @user = User.new(name: "Example User", mail_address: "user@example.com",
   password: "foobar", password_confirmation: "foobar")
  #@user = users(:michael)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should not be too long" do
  @user.name = "a" * 21
  assert_not @user.valid?
  end

  test "mail_address should not be too long" do
  @user.name = "a" * 256
  assert_not @user.valid?
  end

  test "mail_address should be unique" do
  duplicate_user = @user.dup
  duplicate_user.mail_address = @user.mail_address.upcase
  @user.save
  assert_not duplicate_user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "mail_address should be present" do
    @user.mail_address = "     "
    assert_not @user.valid?
  end


  test "mail_address should be saved as lower-case" do
   mixed_case_mail_address = "Foo@ExAMPle.CoM"
   @user.mail_address = mixed_case_mail_address
   @user.save
   assert_equal mixed_case_mail_address.downcase, @user.reload.mail_address
  end

  test "password should have a minimum length" do
   @user.password = @user.password_confirmation = "a" * 5
   assert_not @user.valid?
  end

  test "should get create" do
    get user_create_url
    assert_response :success
  end


  test "should get login" do
    get user_login_url
    assert_response :success
  end

  test "should get show" do
    get user_show_url
    assert_response :success
  end

  test "should get update" do
    get user_update_url
    assert_response :success
  end
end
