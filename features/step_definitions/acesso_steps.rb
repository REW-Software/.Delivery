
Given ('Eu estou na pagina de login') do
  visit root_path
  expect(page).to have_current_path(root_path)
end

Given('Tem registrado um usuario com nome {string}, nascimento {string}, email {string}, cpf {string}, rg {string}, perfil de usuario {string}, senha {string}') do |name, birth, email, cpf, rg, user_type, password|
  visit '/users/new'

  fill_in 'newUserName', with: name
  fill_in 'newUserBirth', with: birth
  fill_in 'newUserEmail', with: email
  fill_in 'newUserCPF', with: cpf
  fill_in 'newUserRG', with: rg
  select(user_type, from: 'user_user_type')
  fill_in 'newUserPassword', with: password
  fill_in 'newUserPasswordConfirmation', with: password

  click_button 'Criar Usuário'

  expect(page).not_to have_current_path('/users/new')
end

Given('Eu estou logado pelas credenciais email {string} e senha {string}') do |email, password|
  visit root_path
  expect(page).to have_current_path(root_path)

  fill_in 'loginEmail', with: email
  fill_in 'loginPassword', with: password
  click_button 'Entrar'

  expect(page).to have_current_path(/users\/\d+/)
end

When ('Eu preencho email {string} e senha {string}') do |email, password|
  fill_in 'loginEmail', with: email
  fill_in 'loginPassword', with: password
end

Then ('Eu vejo que estou na pagina de perfil do usuario {string}') do |username|
  expect(page).to have_current_path(/users\/\d+/)
  expect(page).to have_content(username)
end

Then ('Eu vejo que estou na pagina de login') do
  expect(page).to have_current_path(/(\/|\/sign_in)/)
end