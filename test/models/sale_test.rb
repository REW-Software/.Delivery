require "test_helper"

class SaleTest < ActiveSupport::TestCase
  test "criar venda" do
    product = Product.new(name: "produto", price: 10.00)
    product.save

    sale = Sale.new(product_id: product.id, payment_type: "money", quantity_product: 1, name_client: "cliente", phone_client: "11999991111", street: "rua principal", number: "01")
    assert sale.save
  end

  test "criar venda com campos invalidos" do
    product = Product.new(name: "produto", price: 10.00)
    product.save

    sale = Sale.new(product_id: product.id, payment_type: "", quantity_product: 1, name_client: "", phone_client: "", street: "", number: "")
    assert_not sale.save
  end

  test "criar venda sem produto" do
    product = Product.new(name: "produto", price: 10.00)
    product.save

    sale = Sale.new(product_id: "", payment_type: "", quantity_product: 1, name_client: "", phone_client: "", street: "", number: "")
    assert_not sale.save
  end

  test "deletar venda existente" do
    product = Product.new(name: "produto", price: 10.00)
    product.save

    sale = Sale.new(product_id: product.id, payment_type: "money", quantity_product: 1, name_client: "cliente", phone_client: "11999991111", street: "rua principal", number: "01")
    sale.save
    assert sale.delete 
  end
end
