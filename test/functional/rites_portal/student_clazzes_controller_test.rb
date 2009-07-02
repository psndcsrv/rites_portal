require 'test_helper'

class RitesPortal::StudentClazzesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rites_portal_student_clazzes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_clazz" do
    assert_difference('RitesPortal::StudentClazz.count') do
      post :create, :student_clazz => { }
    end

    assert_redirected_to student_clazz_path(assigns(:student_clazz))
  end

  test "should show student_clazz" do
    get :show, :id => rites_portal_student_clazzes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rites_portal_student_clazzes(:one).to_param
    assert_response :success
  end

  test "should update student_clazz" do
    put :update, :id => rites_portal_student_clazzes(:one).to_param, :student_clazz => { }
    assert_redirected_to student_clazz_path(assigns(:student_clazz))
  end

  test "should destroy student_clazz" do
    assert_difference('RitesPortal::StudentClazz.count', -1) do
      delete :destroy, :id => rites_portal_student_clazzes(:one).to_param
    end

    assert_redirected_to rites_portal_student_clazzes_path
  end
end
