Given('Eu estou na pagina de novo usuario') do
  visit '/users/new'
end

And('Eu preencho o formulario com nome {string}, nascimento {string}, email {string}, cpf {string}, rg {string}, rua {string}, numero da casa {string}, perfil de usuario {string}, senha {string}, confirmacao de senha {string}') do |name, birth, email, cpf, rg, street, number, tipo, password, password_confirmation|

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

And('Eu clico em criar usuario') do
  click_button 'Criar Usuário'
end

And ('Eu crio um usuario valido com nome {string}, nascimento {string}, email {string}, cpf {string}, rg {string}, rua {string}, numero da casa {string}, perfil de usuario {string}, senha {string}, confirmacao de senha {string}') do |name, birth, email, cpf, rg, street, number, tipo, password, password_confirmation|
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
  click_button 'Criar Usuário'
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
  click_button 'Atualizar Usuário'
end

Then('Eu vejo que um novo usuario com nome {string}, nascimento {string}, email {string}, cpf {string}, rg {string}, rua {string}, numero da casa {string}, perfil de usuario {string} foi criado') do |name, birth, email, cpf, rg, street, number, tipo|
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