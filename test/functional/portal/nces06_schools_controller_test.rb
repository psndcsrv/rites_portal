require 'test_helper'

class Portal::Nces06SchoolsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portal_nces06_schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nces06_school" do
    assert_difference('Portal::Nces06School.count') do
      post :create, :nces06_school => { }
    end

    assert_redirected_to nces06_school_path(assigns(:nces06_school))
  end

  test "should show nces06_school" do
    get :show, :id => portal_nces06_schools(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => portal_nces06_schools(:one).to_param
    assert_response :success
  end

  test "should update nces06_school" do
    put :update, :id => portal_nces06_schools(:one).to_param, :nces06_school => { }
    assert_redirected_to nces06_school_path(assigns(:nces06_school))
  end

  test "should destroy nces06_school" do
    assert_difference('Portal::Nces06School.count', -1) do
      delete :destroy, :id => portal_nces06_schools(:one).to_param
    end

    assert_redirected_to portal_nces06_schools_path
  end
end
