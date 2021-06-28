Given('Eu estou na pagina de produtos') do
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
  visit '/products'
  expect(page).to have_current_path('/products')
end

Given('Possui registrado um produto com name {string} e price {string}') do |name, price|
  visit '/products'
  click_link 'Adicionar produto'
  fill_in 'product_name', with: name
  fill_in 'product_price', with: price
  click_button 'Create Product'
end

When('Eu clico em novo produto') do
  click_link 'Adicionar produto'
end

When('Eu preencho o name com {string}, o price {string}') do |name, price|
  fill_in 'product_name', with: name
  fill_in 'product_price', with: price
end

When('Eu clico em criar novo produto') do
  click_button 'Create Product'
end

When('Eu clico em atualizar produto') do
  click_button 'Update Product'
end

Then('Eu vejo um produto com name {string} e price {string}') do |name, price|
  expect(page).to have_content(name)
  expect(page).to have_content(price)
end

Then('Eu nao vejo um produto com name {string} e price {string}') do |name, price|
  expect(page).not_to have_content(name)
  expect(page).not_to have_content(price)
end

Then('Eu vejo uma mensagem com price nao e um numero') do
  expect(page).to have_content('Price is not a number')
end

Then('Eu vejo uma mensagem com nome nao pode ser vazio') do
  expect(page).to have_content("Name can't be blank")
end