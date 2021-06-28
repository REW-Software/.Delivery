require "test_helper"

class DeliveryTest < ActiveSupport::TestCase
  test "criar entrega" do
    product = Product.new(name: "produto", price: 10.00)
    product.save
    sale = Sale.new(product_id: product.id, payment_type: "money", quantity_product: 1, name_client: "cliente", phone_client: "11999991111", street: "rua principal", number: "01")
    sale.save
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555', street:'Manoel Braga', number:'162', tipo:'DeliveryMan', password:'123456', password_confirmation:'123456')
    user.save

    delivery = Delivery.new(sale_id: sale.id, name_delivery_man: "Romulo", status: "em andamento")
    assert delivery.save
  end

  test "criar entrega com campos invalidos" do
    product = Product.new(name: "produto", price: 10.00)
    product.save
    sale = Sale.new(product_id: product.id, payment_type: "money", quantity_product: 1, name_client: "cliente", phone_client: "11999991111", street: "rua principal", number: "01")
    sale.save
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555', street:'Manoel Braga', number:'162', tipo:'DeliveryMan', password:'123456', password_confirmation:'123456')
    user.save

    delivery = Delivery.new(sale_id: sale.id, name_delivery_man: "", status: "")
    assert_not delivery.save
  end

  test "criar entrega sem venda" do
    product = Product.new(name: "produto", price: 10.00)
    product.save
    sale = Sale.new(product_id: product.id, payment_type: "money", quantity_product: 1, name_client: "cliente", phone_client: "11999991111", street: "rua principal", number: "01")
    sale.save
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555', street:'Manoel Braga', number:'162', tipo:'DeliveryMan', password:'123456', password_confirmation:'123456')
    user.save

    delivery = Delivery.new(sale_id: "", name_delivery_man: "Romulo", status: "concluido")
    assert_not delivery.save
  end
end
s