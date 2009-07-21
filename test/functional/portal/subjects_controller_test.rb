require 'test_helper'

class Portal::SubjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portal_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subject" do
    assert_difference('Portal::Subject.count') do
      post :create, :subject => { }
    end

    assert_redirected_to subject_path(assigns(:subject))
  end

  test "should show subject" do
    get :show, :id => portal_subjects(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => portal_subjects(:one).to_param
    assert_response :success
  end

  test "should update subject" do
    put :update, :id => portal_subjects(:one).to_param, :subject => { }
    assert_redirected_to subject_path(assigns(:subject))
  end

  test "should destroy subject" do
    assert_difference('Portal::Subject.count', -1) do
      delete :destroy, :id => portal_subjects(:one).to_param
    end

    assert_redirected_to portal_subjects_path
  end
end
