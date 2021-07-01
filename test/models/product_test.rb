require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "Criar Product" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    type_user:'DeliveryMan', password:'123456', password_confirmation:'123456')
    assert user.save
    post = Post.new(status: 0, user_id: user.id)
    assert post.save


    sale = Sale.new(payment_type: "money", name_client: "cliente", post_id: post.id)
    assert sale.save

    product = Product.new(name: 'ProdutoLegal', price: 10.00, discount: 1.00, quantity_product: 2, sale_id: sale.id)
    assert product.save
  end

  test "Modificar produto" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    type_user:'DeliveryMan', password:'123456', password_confirmation:'123456')
    assert user.save
    post = Post.new(status: 0, user_id: user.id)
    assert post.save


    sale = Sale.new(payment_type: "money", name_client: "cliente", post_id: post.id)
    assert sale.save

    product = Product.new(name: 'ProdutoLegal', price: 10.00, discount: 1.00, quantity_product: 2, sale_id: sale.id)
    assert product.save
    assert product.update(name: 'ProdutoLegalModificado', price: 2.00)
  end

  test "Destruir produto" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    type_user:'DeliveryMan', password:'123456', password_confirmation:'123456')
    assert user.save
    post = Post.new(status: 0, user_id: user.id)
    assert post.save


    sale = Sale.new(payment_type: "money", name_client: "cliente", post_id: post.id)
    assert sale.save

    product = Product.new(name: 'ProdutoLegal', price: 10.00, discount: 1.00, quantity_product: 2, sale_id: sale.id)
    assert product.save
    assert product.destroy
  end

  test "Criar produto com price invalido" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    type_user:'DeliveryMan', password:'123456', password_confirmation:'123456')
    assert user.save
    post = Post.new(status: 0, user_id: user.id)
    assert post.save


    sale = Sale.new(payment_type: "money", name_client: "cliente", post_id: post.id)
    assert sale.save

    product = Product.new(name: 'ProdutoLegal', price: 'abc', discount: 1.00, quantity_product: 2, sale_id: sale.id)
    assert_not product.save
  end
end
