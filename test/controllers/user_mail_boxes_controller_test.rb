require 'test_helper'

class UserMailBoxesControllerTest < ActionController::TestCase
  setup do
    @user_mail_box = user_mail_boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_mail_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_mail_box" do
    assert_difference('UserMailBox.count') do
      post :create, user_mail_box: { email: @user_mail_box.email, login: @user_mail_box.login, name: @user_mail_box.name }
    end

    assert_redirected_to user_mail_box_path(assigns(:user_mail_box))
  end

  test "should show user_mail_box" do
    get :show, id: @user_mail_box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_mail_box
    assert_response :success
  end

  test "should update user_mail_box" do
    patch :update, id: @user_mail_box, user_mail_box: { email: @user_mail_box.email, login: @user_mail_box.login, name: @user_mail_box.name }
    assert_redirected_to user_mail_box_path(assigns(:user_mail_box))
  end

  test "should destroy user_mail_box" do
    assert_difference('UserMailBox.count', -1) do
      delete :destroy, id: @user_mail_box
    end

    assert_redirected_to user_mail_boxes_path
  end
end
