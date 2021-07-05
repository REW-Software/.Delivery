# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

module Seeds 
  def self.run
    user = User.new(name:'admin', birth:'05/12/2000', email:'admin@admin.com', cpf:'480.412.910-31', rg:'173382885', user_type:'Administrador', password:'admin1', password_confirmation:'admin1')
    deliveryMan = User.new(name:'deliveryMan', birth:'05/12/2000', email:'deliveryMan@deliveryMan.com', cpf:'112.695.480-26', rg:'241409184', user_type:'DeliveryMan', password:'deliveryman', password_confirmation:'deliveryman')
    client = User.new(name: 'Matheus', birth:'15/02/1995', email:'matheus@mail.com', cpf:'523.709.300-04', rg: '129911355', user_type:'Client', password:'123456', password_confirmation:'123456')
      
    user.save
    deliveryMan.save
    client.save
  end
end

Seeds.run