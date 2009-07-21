require 'test_helper'

class Portal::ClazzesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portal_clazzes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clazz" do
    assert_difference('Portal::Clazz.count') do
      post :create, :clazz => { }
    end

    assert_redirected_to clazz_path(assigns(:clazz))
  end

  test "should show clazz" do
    get :show, :id => portal_clazzes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => portal_clazzes(:one).to_param
    assert_response :success
  end

  test "should update clazz" do
    put :update, :id => portal_clazzes(:one).to_param, :clazz => { }
    assert_redirected_to clazz_path(assigns(:clazz))
  end

  test "should destroy clazz" do
    assert_difference('Portal::Clazz.count', -1) do
      delete :destroy, :id => portal_clazzes(:one).to_param
    end

    assert_redirected_to portal_clazzes_path
  end
end
