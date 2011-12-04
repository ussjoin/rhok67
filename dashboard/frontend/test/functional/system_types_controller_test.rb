require 'test_helper'

class SystemTypesControllerTest < ActionController::TestCase
  setup do
    @system_type = system_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_type" do
    assert_difference('SystemType.count') do
      post :create, :system_type => @system_type.attributes
    end

    assert_redirected_to system_type_path(assigns(:system_type))
  end

  test "should show system_type" do
    get :show, :id => @system_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @system_type.to_param
    assert_response :success
  end

  test "should update system_type" do
    put :update, :id => @system_type.to_param, :system_type => @system_type.attributes
    assert_redirected_to system_type_path(assigns(:system_type))
  end

  test "should destroy system_type" do
    assert_difference('SystemType.count', -1) do
      delete :destroy, :id => @system_type.to_param
    end

    assert_redirected_to system_types_path
  end
end
