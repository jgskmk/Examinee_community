require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest

  def setup
  @user = User.create(name: "Example User", mail_address: "user@example.com",
     password: "foobar", password_confirmation: "foobar")
  @post = Post.create(content: "example", user_id: @user.id , user_name: "example")
  end



  test "should be user valid" do
    assert @user.valid?
  end

  test "should be valid " do
    assert @post.valid?
  end

  test "content should not be too long" do
  @post.content = "a" * 201
  assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = "     "
    assert_not @post.valid?
  end

  test "should get show" do
    get post_show_url
    assert_response :success
  end

  test "should redirect create when not logged in" do
    get post_create_url
    assert_redirected_to user_login_url
  end

  test "should redirect update when not logged in" do
    get post_update_url
    assert_redirected_to user_login_url
  end


end
