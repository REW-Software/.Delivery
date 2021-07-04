Given('Eu estou na pagina de novo usuario') do
  visit '/users/new'
  expect(page).to have_current_path('/users/new')
end

Given('Eu estou na pagina de usuarios') do
  visit '/users'

end

When('Eu preencho o formulario com nome {string}, nascimento {string}, email {string}, cpf {string}, rg {string}, perfil de usuario {string}, senha {string} e confirmacao de senha {string}') do |name, birth, email, cpf, rg, user_type, password, password_confirmation|

  fill_in 'newUserName', with: name
  fill_in 'newUserBirth', with: birth
  fill_in 'newUserEmail', with: email
  fill_in 'newUserCPF', with: cpf
  fill_in 'newUserRG', with: rg
  select(user_type, from: 'user_user_type')
  fill_in 'newUserPassword', with: password
  fill_in 'newUserPasswordConfirmation', with: password_confirmation
end

Then('Eu vejo que o usuario com nome {string}, nascimento {string}, email {string}, cpf {string}, rg {string}, perfil de usuario {string} esta na lista de usuarios') do |name, birth, email, cpf, rg, user_type|
  visit '/users'
  expect(page).to have_current_path('/users')
  
  # verifica presença de usuario na lista
  expect(page).to have_content(name)

  # entra pra ver mais inforações do usuario
  click_link name
  expect(page).to have_current_path(/users\/\d+/)

  # checa dados informados do usuario
  expect(page).to have_content(birth)
  expect(page).to have_content(email)
  expect(page).to have_content(cpf)
  expect(page).to have_content(rg)
  expect(page).to have_content(user_type)
end

Then('Eu vejo uma mensagem de cpf invalido') do
  expect(page).to have_content('CPF não é válido')
end

Then('Eu vejo que o novo cpf é {string}') do |cpf|
  expect(page).to have_content(cpf)
end

Then('Eu vejo que o usuario de nome {string} e cpf {string} nao esta na lista de usuarios') do |name, cpf|
  visit '/users'
  expect(page).to have_current_path('/users')
  
  # verifica presença de usuario na lista(nome não é necessariamente unico)

  #intera por todos os usuarios que possui o mesmo nome
  page.all(:link, name).each do |link|
    visit link['href']
    expect(page).to have_current_path(/users\/\d+/)

    if page.have_content? name
      expect(page).not_to have_content(cpf)
    end
  end
end