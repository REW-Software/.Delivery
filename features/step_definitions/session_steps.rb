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

Given('Possui registrado um usuario com email {string} e senha {string}') do |email, senha|
  visit '/users/new'
  fill_in 'newUserName', with: 'uzumaki'
  fill_in 'newUserBirth', with: '05-12-1932'
  fill_in 'newUserEmail', with: email
  fill_in 'newUserCPF', with: '207.200.360-11'
  fill_in 'newUserRG', with: '233446916'
  fill_in 'newUserStreet', with: 'A Rua'
  fill_in 'newUserNumber', with: '901'
  fill_in 'newUserPassword', with: senha
  fill_in 'newUserPasswordConfirmation', with: senha
  select('Administrador', from: 'user_tipo')
  click_button 'Criar Usuário'
end

Given ('Eu estou na pagina de perfil') do
  visit '/'
  click_link 'Perfil'
end

Given ('Eu estou na pagina de login') do
  visit '/'
  expect(page).to have_current_path('/')
end

Given ('Eu estou logado') do
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

When ('Eu logo com email {string} e senha {string}') do |email, password|
  fill_in 'loginEmail', with: email
  fill_in 'loginPassword', with: password
  click_button 'Entrar'
end

When ('Eu preencho senha e confirmação de senha com os dados do administrador') do
  fill_in 'newUserPassword', with: '123456'
  fill_in 'newUserPasswordConfirmation', with: '123456'
end

When ('Eu preencho o email {string}, e senha {string}') do |email, senha|
  fill_in 'loginEmail', with: email
  fill_in 'loginPassword', with: senha
end

When ('Eu clico em entrar') do
  click_button 'Entrar'
end

When ('Eu clico em sair') do
  click_link 'Sair'
end

Then ('Eu vejo que estou na pagina de perfil do usuario') do
  expect(page).to have_current_path(/users\/\d+/)
end

Then ('Eu vejo que estou na pagina de login') do
  expect(page).to have_current_path(/(\/|\/sign_in)/)
end