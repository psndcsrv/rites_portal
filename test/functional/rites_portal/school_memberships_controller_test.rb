require 'test_helper'

class RitesPortal::SchoolMembershipsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rites_portal_school_memberships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_membership" do
    assert_difference('RitesPortal::SchoolMembership.count') do
      post :create, :school_membership => { }
    end

    assert_redirected_to school_membership_path(assigns(:school_membership))
  end

  test "should show school_membership" do
    get :show, :id => rites_portal_school_memberships(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rites_portal_school_memberships(:one).to_param
    assert_response :success
  end

  test "should update school_membership" do
    put :update, :id => rites_portal_school_memberships(:one).to_param, :school_membership => { }
    assert_redirected_to school_membership_path(assigns(:school_membership))
  end

  test "should destroy school_membership" do
    assert_difference('RitesPortal::SchoolMembership.count', -1) do
      delete :destroy, :id => rites_portal_school_memberships(:one).to_param
    end

    assert_redirected_to rites_portal_school_memberships_path
  end
end
