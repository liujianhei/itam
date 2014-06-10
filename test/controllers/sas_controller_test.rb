require 'test_helper'

class SasControllerTest < ActionController::TestCase
  setup do
    @sa = sas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sa" do
    assert_difference('Sa.count') do
      post :create, sa: { name: @sa.name }
    end

    assert_redirected_to sa_path(assigns(:sa))
  end

  test "should show sa" do
    get :show, id: @sa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sa
    assert_response :success
  end

  test "should update sa" do
    patch :update, id: @sa, sa: { name: @sa.name }
    assert_redirected_to sa_path(assigns(:sa))
  end

  test "should destroy sa" do
    assert_difference('Sa.count', -1) do
      delete :destroy, id: @sa
    end

    assert_redirected_to sas_path
  end
end
