require 'test_helper'

class RitesPortal::StudentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rites_portal_students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('RitesPortal::Student.count') do
      post :create, :student => { }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, :id => rites_portal_students(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rites_portal_students(:one).to_param
    assert_response :success
  end

  test "should update student" do
    put :update, :id => rites_portal_students(:one).to_param, :student => { }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('RitesPortal::Student.count', -1) do
      delete :destroy, :id => rites_portal_students(:one).to_param
    end

    assert_redirected_to rites_portal_students_path
  end
end
