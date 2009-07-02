require 'test_helper'

class RitesPortal::OfferingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rites_portal_offerings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offering" do
    assert_difference('RitesPortal::Offering.count') do
      post :create, :offering => { }
    end

    assert_redirected_to offering_path(assigns(:offering))
  end

  test "should show offering" do
    get :show, :id => rites_portal_offerings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rites_portal_offerings(:one).to_param
    assert_response :success
  end

  test "should update offering" do
    put :update, :id => rites_portal_offerings(:one).to_param, :offering => { }
    assert_redirected_to offering_path(assigns(:offering))
  end

  test "should destroy offering" do
    assert_difference('RitesPortal::Offering.count', -1) do
      delete :destroy, :id => rites_portal_offerings(:one).to_param
    end

    assert_redirected_to rites_portal_offerings_path
  end
end
