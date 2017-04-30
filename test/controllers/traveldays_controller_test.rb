require 'test_helper'

class TraveldaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travelday = traveldays(:one)
  end

  test "should get index" do
    get traveldays_url
    assert_response :success
  end

  test "should get new" do
    get new_travelday_url
    assert_response :success
  end

  test "should create travelday" do
    assert_difference('Travelday.count') do
      post traveldays_url, params: { travelday: {  } }
    end

    assert_redirected_to travelday_url(Travelday.last)
  end

  test "should show travelday" do
    get travelday_url(@travelday)
    assert_response :success
  end

  test "should get edit" do
    get edit_travelday_url(@travelday)
    assert_response :success
  end

  test "should update travelday" do
    patch travelday_url(@travelday), params: { travelday: {  } }
    assert_redirected_to travelday_url(@travelday)
  end

  test "should destroy travelday" do
    assert_difference('Travelday.count', -1) do
      delete travelday_url(@travelday)
    end

    assert_redirected_to traveldays_url
  end
end
