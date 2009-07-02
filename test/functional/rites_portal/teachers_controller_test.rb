require 'test_helper'

class RitesPortal::TeachersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rites_portal_teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher" do
    assert_difference('RitesPortal::Teacher.count') do
      post :create, :teacher => { }
    end

    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should show teacher" do
    get :show, :id => rites_portal_teachers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rites_portal_teachers(:one).to_param
    assert_response :success
  end

  test "should update teacher" do
    put :update, :id => rites_portal_teachers(:one).to_param, :teacher => { }
    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should destroy teacher" do
    assert_difference('RitesPortal::Teacher.count', -1) do
      delete :destroy, :id => rites_portal_teachers(:one).to_param
    end

    assert_redirected_to rites_portal_teachers_path
  end
end
