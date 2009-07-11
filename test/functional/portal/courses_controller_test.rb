require 'test_helper'

class Portal::CoursesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portal_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Portal::Course.count') do
      post :create, :course => { }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, :id => portal_courses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => portal_courses(:one).to_param
    assert_response :success
  end

  test "should update course" do
    put :update, :id => portal_courses(:one).to_param, :course => { }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Portal::Course.count', -1) do
      delete :destroy, :id => portal_courses(:one).to_param
    end

    assert_redirected_to portal_courses_path
  end
end
