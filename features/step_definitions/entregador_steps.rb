And('Eu troco o status para {string}') do |status|
  select(status, from: 'post_status')
  click_button 'Atualizar entrega'
end

Then('Eu vejo que o status da entrega foi mudado para {string}') do |status|
  expect(page).to have_content(status)
end


Given('Possui registrado uma entrega com entregador {string} e status da entrega {string}') do |deliveryMan, status|
  visit root_path
  expect(page).to have_current_path(root_path)

  fill_in 'loginEmail', with: 'admin@admin.com'
  fill_in 'loginPassword', with: 'admin1'
  click_button 'Entrar'

  expect(page).to have_current_path(/users\/\d+/)

  visit '/posts/new'
  expect(page).to have_current_path('/posts/new')

  select(deliveryMan, from: 'post[user_id]')
  select(status, from: 'post[status]')

  click_button 'Criar Entrega'
  expect(page).not_to have_current_path('/posts/new')

  click_link 'Sair'
end

Then('Eu vejo o horario de requisicao da entrega de entregador {string} e status {string}') do |deliveryMan, status|
  expect(page).to have_content(status)
  expect(page).to have_content(deliveryMan)
  expect(page).to have_content('Requisição da entrega')
end