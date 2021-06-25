Given('Eu estou na pagina de usuarios') do
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
  click_button 'Create User'
  fill_in 'loginEmail', with: 'joseromulo.10@hotmail.com'
  fill_in 'loginPassword', with: '123456'
  click_button 'Logar'
  visit '/users'
end

When('Eu clico em novo entregador') do
  click_link 'Adicionar usuário'
end

And('Eu preencho o formulario com name {string}, birth {string}, email {string}, cpf {string}, rg {string}, street {string}, number {string}, tipo {string}, password {string}, password_confirmation {string}') do |name, birth, email, cpf, rg, street, number, tipo, password, password_confirmation|

  fill_in 'newUserName', with: name
  fill_in 'newUserBirth', with: birth
  fill_in 'newUserEmail', with: email
  fill_in 'newUserCPF', with: cpf
  fill_in 'newUserRG', with: rg
  fill_in 'newUserStreet', with: street
  fill_in 'newUserNumber', with: number
  select(tipo, from: 'user_tipo')
  fill_in 'newUserPassword', with: password
  fill_in 'newUserPasswordConfirmation', with: password_confirmation
end

And('Eu clico em criar novo entregador') do
  click_button 'Create User'
end

And ('Eu crio um user valido com name {string}, birth {string}, email {string}, cpf {string}, rg {string}, street {string}, number {string}, tipo {string}, password {string}, password_confirmation {string}') do |name, birth, email, cpf, rg, street, number, tipo, password, password_confirmation|
  click_link 'Adicionar usuário'
  fill_in 'newUserName', with: name
  fill_in 'newUserBirth', with: birth
  fill_in 'newUserEmail', with: email
  fill_in 'newUserCPF', with: cpf
  fill_in 'newUserRG', with: rg
  fill_in 'newUserStreet', with: street
  fill_in 'newUserNumber', with: number
  select(tipo, from: 'user_tipo')
  fill_in 'newUserPassword', with: password
  fill_in 'newUserPasswordConfirmation', with: password_confirmation
  click_button 'Create User'
end

And ('Eu preencho o campo de cpf com {string}') do |cpf|
  fill_in 'newUserPassword', with: '123456'
  fill_in 'newUserPasswordConfirmation', with: '123456'
  fill_in 'newUserCPF', with: cpf
end

When ('Eu clico em editar usuario') do
  click_link 'Editar'
end

And ('Eu clico em atualizar usuario') do
  click_button 'Update User'
end

Then('Eu vejo que um novo usuario com name {string}, birth {string}, email {string}, cpf {string}, rg {string}, street {string}, number {string}, tipo {string} foi criado') do |name, birth, email, cpf, rg, street, number, tipo|
  expect(page).to have_content(name)
  expect(page).to have_content(birth)
  expect(page).to have_content(email)
  expect(page).to have_content(cpf)
  expect(page).to have_content(rg)
  expect(page).to have_content(street)
  expect(page).to have_content(number)
  expect(page).to have_content(tipo)
end

Then('Eu vejo uma mensagem de email invalido') do
  expect(page).to have_content('Email is invalid')
end

Then('Eu vejo uma mensagem de cpf invalido') do
  expect(page).to have_content('Cpf is invalid')
end

Then('Eu vejo que o novo cpf é {string}') do |cpf|
  expect(page).to have_content(cpf)
end