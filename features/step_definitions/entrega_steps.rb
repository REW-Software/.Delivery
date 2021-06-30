require 'webdrivers'

Given("Eu estou na pagina de entregas") do
  visit "/posts"
end

Given("Possui registrado uma entrega com venda {string}, entregador {string}, status {string}") do |sale, user, status|
  visit "/posts"
  click_link "Adicionar entrega"

  fill_in "post[sale]",	with: sale
  fill_in "post[user]",	with: user
  fill_in "post[status]",	with: status
end

When("Eu clico em adicionar entrega") do
  click_link "Adicionar entrega"
end

When("Eu preencho com venda {string}, entregador {string}, status {string}") do |sale, user, status|
  select sale,	:from => "Sale"
  select user,	:from => "User"
  select(status, from: 'status')
end

And("Eu clico em criar nova entrega") do
  click_button "Criar entrega"
end

Then("Eu vejo que uma entrega com venda {string}, entregador {string}, status {string}") do |sale, user, status|
  visit "/posts"
  click_link post

  expect(page).to have_content(sale)
  expect(page).to have_content(user)
  expect(page).to have_content(status)
end

When ('Eu clico em editar entrega') do
  click_link 'Editar'
end

And ('Eu clico em atualizar entrega') do
  click_button 'Editar entrega'
end

Then("Eu vejo uma entrega com venda {string}, entregador {string}, status {string}") do |sale, user, status|
  expect(page).to have_content(sale)
  expect(page).to have_content(user)
  expect(page).to have_content(status)
end