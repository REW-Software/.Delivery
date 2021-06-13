require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Criar user do tipo deliveryMan' do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    street:'Manoel Braga', number:'162', tipo:'DeliveryMan')

    assert user.save
  end

  test 'Excluir user' do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    street:'Manoel Braga', number:'162', tipo:'DeliveryMan')

    name = user.name
    assert user.save

    user.destroy

    user = User.find_by(name: name)

    assert_not user
  end

  test 'Criando user invalido' do
    user = User.new(name:'', birth:'', email:'', cpf:'', rg:'',
                    street:'', number:'', tipo:'')

    assert_not user.save
  end
end
