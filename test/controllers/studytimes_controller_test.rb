require 'test_helper'

class StudytimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @studytime = studytimes(:one)
  end

  test "should get index" do
    get studytimes_url
    assert_response :success
  end

  test "should get new" do
    get new_studytime_url
    assert_response :success
  end

  test "should create studytime" do
    assert_difference('Studytime.count') do
      post studytimes_url, params: { studytime: { date: @studytime.date, hours: @studytime.hours, minutes: @studytime.minutes, user_id: @studytime.user_id } }
    end

    assert_redirected_to studytime_url(Studytime.last)
  end

  test "should show studytime" do
    get studytime_url(@studytime)
    assert_response :success
  end

  test "should get edit" do
    get edit_studytime_url(@studytime)
    assert_response :success
  end

  test "should update studytime" do
    patch studytime_url(@studytime), params: { studytime: { date: @studytime.date, hours: @studytime.hours, minutes: @studytime.minutes, user_id: @studytime.user_id } }
    assert_redirected_to studytime_url(@studytime)
  end

  test "should destroy studytime" do
    assert_difference('Studytime.count', -1) do
      delete studytime_url(@studytime)
    end

    assert_redirected_to studytimes_url
  end
end
