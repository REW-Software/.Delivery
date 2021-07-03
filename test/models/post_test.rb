require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "criar entrega" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    user_type:'DeliveryMan', password:'123456', password_confirmation:'123456')
    assert user.save
    post = Post.new(status: 0, user_id: user.id)
    assert post.save
  end

  test "excluir entrega" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    user_type:'DeliveryMan', password:'123456', password_confirmation:'123456')
    assert user.save


    post = Post.new(status: 0, user_id: user.id)
    assert post.save

    id = post.id
    assert post.destroy
    post = Post.find_by(id: id)
    assert_not post
  end
end