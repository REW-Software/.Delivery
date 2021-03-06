Given('Tem registrado um produto com nome {string}, preco {string}, desconto {string} e quantidade {string} na venda do entregador {string} para o cliente {string}') do |product_name, price, discount, quantity, delivery_man_name, client_name|
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

  #garante entrar na venda certa
  page.all(:link, 'Vizualizar detalhes de venda').each do |link|
    visit link['href']
    if page.has_content? client_name
      break;
    else
      page.go_back
    end
  end
  expect(page).to have_current_path(/sales\/\d+\?post_id=\d+/)
  
  # entra na pagina de adicionar produto
  click_link('Adicionar produto na venda')
  expect(page).to have_current_path(/\/products\/new/)

  # preenche e cria a venda
  fill_in 'product_name', with: product_name
  fill_in 'product_price', with: price
  fill_in 'product_discount', with: discount
  fill_in 'product_product_quantity', with: quantity
  click_button('Criar')
  expect(page).to have_current_path(/sales\/\d+\?post_id=\d+/)
end

When('Eu preencho nome do produto {string}, preco {string}, desconto {string} e quantidade {string}') do |product_name, price, discount, quantity|
  fill_in 'product_name', with: product_name
  fill_in 'product_price', with: price
  fill_in 'product_discount', with: discount
  fill_in 'product_product_quantity', with: quantity
end

Then('Eu vejo um produto com nome {string} e {string} unidades') do |product_name, quantity|
  expect(page).to have_content(product_name + ' ' + quantity + ' unidades')
end

Then('Eu vejo que ha produtos na lista') do
  expect(page).to have_current_path(/sales\/\d+\?post_id=\d+/)

  #products/1?post_id=2&sale_id=2
  has_products = page.all(:link, /\/products\/\d+\?post_id=\d+\&sale_id=\d+/).empty?

  expect(has_products).to be(true)
end

Then('Eu vejo preco total de {string}') do |price|
  expect(page).to have_current_path(/sales\/\d+\?post_id=\d+/)
  expect(page).to have_content(price)
end

Then('Eu nao vejo um produto com nome {string}') do |product_name|
  expect(page).to have_current_path(/sales\/\d+\?post_id=\d+/)
  expect(page).not_to have_content(product_name)
end

Then('Eu vejo um produto com nome {string}, preco {string}, desconto {string} e quantidade {string}') do |product_name, price, discount, quantity|
  expect(page).to have_current_path(/products\/\d+\?post_id=\d+/)
  
  expect(page).to have_content(product_name)
  expect(page).to have_content(price)
  expect(page).to have_content(discount)
  expect(page).to have_content(quantity)
end