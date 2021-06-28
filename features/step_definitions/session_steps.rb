Given('Eu estou logado como um administrador') do
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
end

Given ('Eu estou na pagina de perfil') do
  visit '/'
  click_link 'Perfil'
end

When ('Eu logo com email {string} e senha {string}') do |email, password|
  fill_in 'loginEmail', with: email
  fill_in 'loginPassword', with: password
  click_button 'Entrar'
end

When ('Eu preencho senha e confirmação de senha com os dados do administrador') do
  fill_in 'newUserPassword', with: '123456'
  fill_in 'newUserPasswordConfirmation', with: '123456'
end