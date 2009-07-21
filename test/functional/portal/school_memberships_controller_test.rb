require 'test_helper'

class Portal::SchoolMembershipsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portal_school_memberships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_membership" do
    assert_difference('Portal::SchoolMembership.count') do
      post :create, :school_membership => { }
    end

    assert_redirected_to school_membership_path(assigns(:school_membership))
  end

  test "should show school_membership" do
    get :show, :id => portal_school_memberships(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => portal_school_memberships(:one).to_param
    assert_response :success
  end

  test "should update school_membership" do
    put :update, :id => portal_school_memberships(:one).to_param, :school_membership => { }
    assert_redirected_to school_membership_path(assigns(:school_membership))
  end

  test "should destroy school_membership" do
    assert_difference('Portal::SchoolMembership.count', -1) do
      delete :destroy, :id => portal_school_memberships(:one).to_param
    end

    assert_redirected_to portal_school_memberships_path
  end
end
