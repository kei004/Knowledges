require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
  end
  

  test "login with valid information followed by " do
    get login_path
    post login_path, params: { session: {email: @user.email,password:'password'}}
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_template root_path


    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

end