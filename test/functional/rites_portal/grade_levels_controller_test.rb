require 'test_helper'

class RitesPortal::GradeLevelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rites_portal_grade_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grade_level" do
    assert_difference('RitesPortal::GradeLevel.count') do
      post :create, :grade_level => { }
    end

    assert_redirected_to grade_level_path(assigns(:grade_level))
  end

  test "should show grade_level" do
    get :show, :id => rites_portal_grade_levels(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rites_portal_grade_levels(:one).to_param
    assert_response :success
  end

  test "should update grade_level" do
    put :update, :id => rites_portal_grade_levels(:one).to_param, :grade_level => { }
    assert_redirected_to grade_level_path(assigns(:grade_level))
  end

  test "should destroy grade_level" do
    assert_difference('RitesPortal::GradeLevel.count', -1) do
      delete :destroy, :id => rites_portal_grade_levels(:one).to_param
    end

    assert_redirected_to rites_portal_grade_levels_path
  end
end
