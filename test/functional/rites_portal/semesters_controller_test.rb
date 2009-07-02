require 'test_helper'

class RitesPortal::SemestersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rites_portal_semesters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create semester" do
    assert_difference('RitesPortal::Semester.count') do
      post :create, :semester => { }
    end

    assert_redirected_to semester_path(assigns(:semester))
  end

  test "should show semester" do
    get :show, :id => rites_portal_semesters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rites_portal_semesters(:one).to_param
    assert_response :success
  end

  test "should update semester" do
    put :update, :id => rites_portal_semesters(:one).to_param, :semester => { }
    assert_redirected_to semester_path(assigns(:semester))
  end

  test "should destroy semester" do
    assert_difference('RitesPortal::Semester.count', -1) do
      delete :destroy, :id => rites_portal_semesters(:one).to_param
    end

    assert_redirected_to rites_portal_semesters_path
  end
end
