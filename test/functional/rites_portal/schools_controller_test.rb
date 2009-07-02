require 'test_helper'

class RitesPortal::SchoolsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rites_portal_schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school" do
    assert_difference('RitesPortal::School.count') do
      post :create, :school => { }
    end

    assert_redirected_to school_path(assigns(:school))
  end

  test "should show school" do
    get :show, :id => rites_portal_schools(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rites_portal_schools(:one).to_param
    assert_response :success
  end

  test "should update school" do
    put :update, :id => rites_portal_schools(:one).to_param, :school => { }
    assert_redirected_to school_path(assigns(:school))
  end

  test "should destroy school" do
    assert_difference('RitesPortal::School.count', -1) do
      delete :destroy, :id => rites_portal_schools(:one).to_param
    end

    assert_redirected_to rites_portal_schools_path
  end
end
