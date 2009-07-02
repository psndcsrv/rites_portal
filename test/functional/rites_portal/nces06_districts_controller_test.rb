require 'test_helper'

class RitesPortal::Nces06DistrictsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rites_portal_nces06_districts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nces06_district" do
    assert_difference('RitesPortal::Nces06District.count') do
      post :create, :nces06_district => { }
    end

    assert_redirected_to nces06_district_path(assigns(:nces06_district))
  end

  test "should show nces06_district" do
    get :show, :id => rites_portal_nces06_districts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rites_portal_nces06_districts(:one).to_param
    assert_response :success
  end

  test "should update nces06_district" do
    put :update, :id => rites_portal_nces06_districts(:one).to_param, :nces06_district => { }
    assert_redirected_to nces06_district_path(assigns(:nces06_district))
  end

  test "should destroy nces06_district" do
    assert_difference('RitesPortal::Nces06District.count', -1) do
      delete :destroy, :id => rites_portal_nces06_districts(:one).to_param
    end

    assert_redirected_to rites_portal_nces06_districts_path
  end
end
