Given ('Eu estou na pagina home') do
  visit home_path
  expect(page).to have_current_path(home_path)
end

When('Eu clico no {string}') do |link_name|
  click_link link_name
end

When('Eu clico no botao {string}') do |button_name|
  click_button button_name 
end

When('Eu clico em editar') do 
  click_link 'Editar'
end

When('Eu clico em deletar') do
  click_link 'Deletar'
end

When ('Eu confirmo a acao') do
  page.driver.browser.switch_to.alert.accept
end

Then('Eu vejo uma mensagem de email invalido') do
  expect(page).to have_content('endereço de e-mail não é válido')
end