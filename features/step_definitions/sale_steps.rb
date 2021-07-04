Given('Tem registrado uma venda com o entregador {string} para o cliente {string} em {string}') do |delivery_man_name, client_name, payment_type|
  #garante estar na pagina de deliveries
  visit '/openDeliveries'
  expect(page).to have_current_path('/openDeliveries')

  #garante entrar na entrega certa
  page.all(:link, 'Entrega').each do |link|
    visit link['href']
    if page.has_content? delivery_man_name
      break
    else
      page.go_back
    end
  end
  expect(page).to have_current_path(/posts\/\d+/)

  # entra na pagina de adicionar venda
  click_link('Adicionar venda')
  expect(page).to have_current_path(/\/sales\/new/)

  # preenche e cria a venda
  select(client_name, from: 'sale[client_name]')
  select(payment_type, from: 'sale[payment_type]')
  click_button('Criar Venda')
end

When('Eu preencho cliente {string} e pagamento {string}') do |client_name, payment_type|
  select(client_name, from: 'sale[client_name]')
  select(payment_type, from: 'sale[payment_type]')
end

When('Eu clico na venda com cliente {string}') do |client_name|
  # intera por todas as entregas
  
  page.all(:link, 'Vizualizar detalhes de venda').each do |link|
    visit link['href']

    # acha o entregador
    if page.has_no_content? client_name
      page.go_back
    else
      break
    end
  end
  expect(page).to have_current_path(/sales\/\d+/)
end

Then('Eu vejo uma venda com o cliente {string} e pagamento {string}') do |client_name, payment_type|
  expect(page).to have_content client_name  
  expect(page).to have_content payment_type
end

Then('Eu vejo que ha vendas na lista') do
  expect(page).to have_content(/Vizualizar detalhes de venda/)
end

Then('Eu vejo que a venda com entregador {string} para o cliente {string} nao esta na lista') do |delivery_man_name, client_name|
  # verifica se tá na pagina que possui vendas
  expect(page).to have_current_path(/sales\/\d+/)
  expect(page).to have_content(delivery_man_name)

  page.all(:link, 'Vizualizar detalhes de venda').each do |link|
    visit link['href']
    expect(page).not_to have_content(client_name)
    page.go_back
  end
end