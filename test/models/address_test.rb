require "test_helper"

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "criar address valido" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    type_user:'DeliveryMan', password:'123456', password_confirmation:'123456')

    assert user.save

    address = Address.new(cep: '55380-000', city: 'Cachoeirinha', district: 'Centro', street: 'Manoel Braga', number: '162', user_id: user.id)
    assert address.save
  end

  test "criar address com cep invalido" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    type_user:'DeliveryMan', password:'123456', password_confirmation:'123456')

    assert user.save

    address = Address.new(cep: '55380000', city: 'Cachoeirinha', district: 'Centro', street: 'Manoel Braga', number: '162', user_id: user.id)
    assert_not address.save
  end

  test "excluir address" do
    user = User.new(name:'Romulo', birth:'05/12/2000', email:'joseromulo@hotmail.com', cpf:'118.129.724-90', rg:'555555',
                    type_user:'DeliveryMan', password:'123456', password_confirmation:'123456')

    assert user.save

    address = Address.new(cep: '55380-000', city: 'Cachoeirinha', district: 'Centro', street: 'Manoel Braga', number: '162', user_id: user.id)
    assert address.save

    id = address.id

    assert address.destroy

    address = Address.find_by(id: id)
    assert_not address
  end
end
