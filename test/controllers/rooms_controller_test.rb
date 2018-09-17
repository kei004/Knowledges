require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get rooms_home_url
    assert_response :success
  end

  test "should get table" do
    get roomhome_path
    assert_response :success
  end

  test "should get qa" do
    get question_path
    assert_response :success
  end

  test "should get note" do
    get note_path
    assert_response :success
  end

  test "should get discuss" do
    get discussion_path
    assert_response :success
  end
end
