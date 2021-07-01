require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Criar user do tipo deliveryMan' do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    type_user:'DeliveryMan', password:'123456', password_confirmation:'123456')

    assert user.save
  end

  test 'Excluir user' do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    type_user:'DeliveryMan', password:'123456', password_confirmation:'123456')

    name = user.name
    assert user.save

    assert user.destroy

    user = User.find_by(name: name)

    assert_not user
  end

  test 'Criando user invalido' do
    user = User.new(name:'', birth:'', email:'', cpf:'', rg:'',
                    type_user:'', password:'', password_confirmation:'')

    assert_not user.save
  end
end
