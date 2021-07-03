require "test_helper"

class SaleTest < ActiveSupport::TestCase
  test "criar venda" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    user_type:'DeliveryMan', password:'123456', password_confirmation:'123456')
    assert user.save
    post = Post.new(status: 0, user_id: user.id)
    assert post.save


    sale = Sale.new(payment_type: "money", client_name: "cliente", post_id: post.id)
    assert sale.save
  end

  test "criar venda com campo invalidos" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    user_type:'DeliveryMan', password:'123456', password_confirmation:'123456')
    assert user.save
    post = Post.new(status: 0, user_id: user.id)
    assert post.save


    sale = Sale.new(payment_type: "money", client_name: "", post_id: post.id)
    assert_not sale.save
  end

  test "deletar venda existente" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    user_type:'DeliveryMan', password:'123456', password_confirmation:'123456')
    assert user.save
    post = Post.new(status: 0, user_id: user.id)
    assert post.save


    sale = Sale.new(payment_type: "money", client_name: "cliente", post_id: post.id)
    assert sale.save

    id = sale.id
    assert sale.destroy
    sale = Sale.find_by(id: id)
    assert_not sale
  end
end
