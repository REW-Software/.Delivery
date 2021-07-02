
Given ('Tem registrado uma entrega com entregador {string} e status da entrega {string}') do |entregador, status|
  
  # garante que está na pagina de criar entrega
  visit '/posts/new'
  expect(page).to have_current_path('/posts/new')

  # preenche campos
  select(entregador, from: 'post[user_id]')
  select(status, from: 'post[status]')

  # cria
  click_button 'Criar Entrega'

  # espera que tenha sido criado
  expect(page).not_to have_current_path('/posts/new')
end

When ('Eu preencho entregador {string} e status da entrega {string}') do |entregador, status|
  select(entregador, from: 'post[user_id]')
  select(status, from: 'post[status]')
end

When ('Eu clico na entrega com entregador {string}') do |entregador|
  # intera por todas as entregas
  
  page.all(:link, 'Entrega').each do |link|
    link.click

    # acha o entregador
    if page.has_no_content? entregador
      page.go_back
    end
  end

  expect(page).to have_current_path(/posts\/\d+/)
end

Then ('Eu vejo uma entrega com o entregador {string} e status da entrega {string}') do |entregador, status|
  # verifica se tá na pagina de visualizar entrega
  expect(page).to have_current_path(/posts\/\d+/)

  #verifica se tem o nome do entregador na pagina
  expect(page).to have_content(entregador)
  expect(page).to have_content(status)
end

Then ('Eu vejo que ha entregas na lista') do
  expect(page).to have_content(/Entrega \d+/)
end