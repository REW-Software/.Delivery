require "test_helper"

class DeliveryControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery = deliveries(:one)
  end

  test "should get index" do
    get deliveries_url
    assert_response :success
  end

  test "should show sale" do
    get deliveries_url(@sale)
    assert_response :success
  end

  test "should get new" do
    get new_deliveries_url
    assert_response :success
  end
end
