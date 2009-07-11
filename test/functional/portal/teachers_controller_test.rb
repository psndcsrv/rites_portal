require 'test_helper'

class Portal::TeachersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portal_teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher" do
    assert_difference('Portal::Teacher.count') do
      post :create, :teacher => { }
    end

    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should show teacher" do
    get :show, :id => portal_teachers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => portal_teachers(:one).to_param
    assert_response :success
  end

  test "should update teacher" do
    put :update, :id => portal_teachers(:one).to_param, :teacher => { }
    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should destroy teacher" do
    assert_difference('Portal::Teacher.count', -1) do
      delete :destroy, :id => portal_teachers(:one).to_param
    end

    assert_redirected_to portal_teachers_path
  end
end
