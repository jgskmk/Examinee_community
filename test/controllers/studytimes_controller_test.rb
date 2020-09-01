require 'test_helper'

class StudytimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @studytime = studytimes(:one)
  end

  test "should be valid " do
    assert @studytime.valid?
  end

  test "should redirect index when not logged in" do
    get studytimes_url
    assert_redirected_to user_login_url
  end

  test "should redirect new when not logged in" do
    get new_studytime_url
    assert_redirected_to user_login_url
  end

  test "should create studytime" do
    log_in_as(users(:michael))
    assert_difference('Studytime.count') do
      post studytimes_url, params: { studytime: { date: @studytime.date, hours: @studytime.hours, minutes: @studytime.minutes, user_id: @studytime.user_id } }
    end

    assert_redirected_to studytime_url(Studytime.last)
  end

  test "should redirect show when not logged in" do
    get studytime_url(@studytime)
    assert_redirected_to user_login_url
  end

  test "should redirect edit when not logged in" do
    get edit_studytime_url(@studytime)
    assert_redirected_to user_login_url
  end

  test "should update studytime" do
    log_in_as(users(:michael))
    patch studytime_url(@studytime), params: { studytime: { date: @studytime.date, hours: @studytime.hours, minutes: @studytime.minutes, user_id: @studytime.user_id } }
    assert_redirected_to studytime_url(@studytime)
  end

  test "should destroy studytime" do
    log_in_as(users(:michael))
    assert_difference('Studytime.count', -1) do
      delete studytime_url(@studytime)
    end

    assert_redirected_to studytimes_url
  end
end
