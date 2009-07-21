require 'test_helper'

class Portal::DistrictsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portal_districts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create district" do
    assert_difference('Portal::District.count') do
      post :create, :district => { }
    end

    assert_redirected_to district_path(assigns(:district))
  end

  test "should show district" do
    get :show, :id => portal_districts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => portal_districts(:one).to_param
    assert_response :success
  end

  test "should update district" do
    put :update, :id => portal_districts(:one).to_param, :district => { }
    assert_redirected_to district_path(assigns(:district))
  end

  test "should destroy district" do
    assert_difference('Portal::District.count', -1) do
      delete :destroy, :id => portal_districts(:one).to_param
    end

    assert_redirected_to portal_districts_path
  end
end
