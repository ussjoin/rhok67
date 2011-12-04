require 'test_helper'

class SensorBoxesControllerTest < ActionController::TestCase
  setup do
    @sensor_box = sensor_boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sensor_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sensor_box" do
    assert_difference('SensorBox.count') do
      post :create, :sensor_box => @sensor_box.attributes
    end

    assert_redirected_to sensor_box_path(assigns(:sensor_box))
  end

  test "should show sensor_box" do
    get :show, :id => @sensor_box.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sensor_box.to_param
    assert_response :success
  end

  test "should update sensor_box" do
    put :update, :id => @sensor_box.to_param, :sensor_box => @sensor_box.attributes
    assert_redirected_to sensor_box_path(assigns(:sensor_box))
  end

  test "should destroy sensor_box" do
    assert_difference('SensorBox.count', -1) do
      delete :destroy, :id => @sensor_box.to_param
    end

    assert_redirected_to sensor_boxes_path
  end
end
