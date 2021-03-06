require 'test_helper'

class SpecialPricesControllerTest < ActionController::TestCase
  setup do
    @special_price = special_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:special_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create special_price" do
    assert_difference('SpecialPrice.count') do
      post :create, special_price: { end_date: @special_price.end_date, price: @special_price.price, room_id: @special_price.room_id, start_date: @special_price.start_date }
    end

    assert_redirected_to special_price_path(assigns(:special_price))
  end

  test "should show special_price" do
    get :show, id: @special_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @special_price
    assert_response :success
  end

  test "should update special_price" do
    patch :update, id: @special_price, special_price: { end_date: @special_price.end_date, price: @special_price.price, room_id: @special_price.room_id, start_date: @special_price.start_date }
    assert_redirected_to special_price_path(assigns(:special_price))
  end

  test "should destroy special_price" do
    assert_difference('SpecialPrice.count', -1) do
      delete :destroy, id: @special_price
    end

    assert_redirected_to special_prices_path
  end
end
