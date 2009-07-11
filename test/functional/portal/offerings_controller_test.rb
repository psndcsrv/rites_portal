require 'test_helper'

class Portal::OfferingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portal_offerings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offering" do
    assert_difference('Portal::Offering.count') do
      post :create, :offering => { }
    end

    assert_redirected_to offering_path(assigns(:offering))
  end

  test "should show offering" do
    get :show, :id => portal_offerings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => portal_offerings(:one).to_param
    assert_response :success
  end

  test "should update offering" do
    put :update, :id => portal_offerings(:one).to_param, :offering => { }
    assert_redirected_to offering_path(assigns(:offering))
  end

  test "should destroy offering" do
    assert_difference('Portal::Offering.count', -1) do
      delete :destroy, :id => portal_offerings(:one).to_param
    end

    assert_redirected_to portal_offerings_path
  end
end
