require "test_helper"

class DeliveryTest < ActiveSupport::TestCase
  test "criar entrega" do
    delivery = Delivery.new(sale_id: "1", user_id: "1", status: "progress")
    assert delivery.save
  end

  test "criar entrega com campos invalidos" do
    delivery = Delivery.new(sale_id: "1", user_id: "", status: "")
    assert_not delivery.save
  end

  test "criar entrega sem venda" do
    delivery = Delivery.new(sale_id: "", user_id: "1", status: "concluded")
    assert_not delivery.save
  end
end
s