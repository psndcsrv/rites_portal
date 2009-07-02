require 'test_helper'

class RitesPortal::LearnersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rites_portal_learners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learner" do
    assert_difference('RitesPortal::Learner.count') do
      post :create, :learner => { }
    end

    assert_redirected_to learner_path(assigns(:learner))
  end

  test "should show learner" do
    get :show, :id => rites_portal_learners(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rites_portal_learners(:one).to_param
    assert_response :success
  end

  test "should update learner" do
    put :update, :id => rites_portal_learners(:one).to_param, :learner => { }
    assert_redirected_to learner_path(assigns(:learner))
  end

  test "should destroy learner" do
    assert_difference('RitesPortal::Learner.count', -1) do
      delete :destroy, :id => rites_portal_learners(:one).to_param
    end

    assert_redirected_to rites_portal_learners_path
  end
end
