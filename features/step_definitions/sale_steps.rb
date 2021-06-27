require 'webdrivers'

And("Um produto com o nome {string") do |name, price|
  Product.create(name: produto, price: 10.00)
end

Given("Eu estou na pagina de vendas") do
  visit '/users/new'
  fill_in 'newUserName', with: 'romulo'
  fill_in 'newUserBirth', with: '05-12-2000'
  fill_in 'newUserEmail', with: 'joseromulo.10@hotmail.com'
  fill_in 'newUserCPF', with: '118.129.724-90'
  fill_in 'newUserRG', with: '125345'
  fill_in 'newUserStreet', with: 'manoel Braga'
  fill_in 'newUserNumber', with: '162'
  fill_in 'newUserPassword', with: '123456'
  fill_in 'newUserPasswordConfirmation', with: '123456'
  select('Administrador', from: 'user_tipo')
  click_button 'Criar Usuário'
  fill_in 'loginEmail', with: 'joseromulo.10@hotmail.com'
  fill_in 'loginPassword', with: '123456'
  click_button 'Entrar'
  visit "/sales"
end

Given("Possui registrado uma venda com product {string}, quantity {string}, payment {string}, client {string}, phone {string}, street {string} e number {string}") do |product, quantity, payment, client, phone, street, number|
  sale = Sale.new product_id: Product.find_by(name: product).id, quantity_product: quantity, payment_type: payment, name_client: client, phone_client: phone, street: street, number: number
  sale.save()
end

When("Eu clico em adicionar venda") do
  click_link "Adicionar venda"
end

When('Eu preencho com product {string}, quantity {string}, payment {string}, client {string}, phone {string}, street {string} e number {string}') do |product, quantity, payment, client, phone, street, number|
  select product, :from => "Produto"
  select payment,	:from => "Pagamento"

  fill_in "sale[quantity_product]",	with: quantity
  fill_in "sale[name_client]",	with: client
  fill_in "sale[phone_client]",	with: phone
  fill_in "sale[street]",	with: street
  fill_in "sale[number]",	with: number
end

And("Eu clico em criar nova venda") do
  click_button "Criar Venda"
end

Then('Eu vejo que uma venda com product {string}, quantity {string}, payment {string}, client {string}, phone {string}, street {string} e number {string}') do |product, quantity, payment, client, phone, street, number|
  visit "/sales"
  click_link client

  expect(page).to have_content(product)
  expect(page).to have_content(quantity)
  expect(page).to have_content(payment)
  expect(page).to have_content(client)
  expect(page).to have_content(phone)
  expect(page).to have_content(street)
  expect(page).to have_content(number)
end

Then("Eu vejo uma mensagem com quantidade 0 invalida") do
  expect(page).to have_content("Quantity product must be greater than 0")
end

Then("Eu vejo uma mensagem com quantiade nao pode ser vazio") do
  expect(page).to have_content("Quantity product can't be blank")
end

Then("Eu vejo uma mensagem com cliente nao pode ser vazio") do
  expect(page).to have_content("Name client can't be blank")
end

Then("Eu vejo uma mensagem com numero nao pode ser vazio") do
  expect(page).to have_content("Number can't be blank")
end

When("Eu clico em remover uma venda pelo id da venda {string}") do |saleid|
  visit "/sales"
  click_link "d-#{saleid}"
end

Then('Eu vejo uma venda com cliente {string} e price {string}') do |name, price|
  expect(page).to have_content(name)
  expect(page).to have_content(price)
end