require 'test_helper'

class RitesPortal::ClazzesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rites_portal_clazzes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clazz" do
    assert_difference('RitesPortal::Clazz.count') do
      post :create, :clazz => { }
    end

    assert_redirected_to clazz_path(assigns(:clazz))
  end

  test "should show clazz" do
    get :show, :id => rites_portal_clazzes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rites_portal_clazzes(:one).to_param
    assert_response :success
  end

  test "should update clazz" do
    put :update, :id => rites_portal_clazzes(:one).to_param, :clazz => { }
    assert_redirected_to clazz_path(assigns(:clazz))
  end

  test "should destroy clazz" do
    assert_difference('RitesPortal::Clazz.count', -1) do
      delete :destroy, :id => rites_portal_clazzes(:one).to_param
    end

    assert_redirected_to rites_portal_clazzes_path
  end
end
