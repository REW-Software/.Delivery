And("Um produto com o nome {string") do |name, price|
  Product.create(name: produto, price: 10.00)
end

And("Eu estou na pagina administrar vendas") do
  visit "/sales"
end

When("Eu clico em nova venda") do
  click_button "Nova venda"
end

And("Eu preencho o produto {string}, o tipo de pagamento {string}, a quantidade do produto {string}, o nome do cliente {string}, o telefone do cliente {string}, a rua do clinte {string}, o número da casa do cliente {string}") do |name_product, payment_type, quantity, name_cliente, phone_client, street, number|
  visit "/sales/new"

  select name_product, :from => "Product"

  fill_in "sale[payment_type]",	with: => payment_type
  fill_in "sale[quantity]",	with: => quantity
  fill_in "sale[name_client]",	with: => name_client
  fill_in "sale[phone_client]",	with: => phone_client
  fill_in "sale[street]",	with: => street
  fill_in "sale[number]",	with: => number
end

And("Eu clico em criar nova venda") do
  click_button "create"
end

Then("Eu vejo que uma nova venda foi criada") do
  visit "/sales"
end

Then("Eu vejo uma mensagem dados invalidos") do
  assert_selector('div#error_explanation')
end

When("Eu clico em remover uma venda pelo id da venda {string}") do |sale.id|
  visit "/sales"
  click_link "d-#{sale.id}"
end

Then("Eu vejo que a venda foi removida") do |sale.id|
  expect(page).to have_no_content(sale.id)
end

When("Eu clico em editar uma venda pelo id da venda {string}") do |sale.id|
  visit "/sales"
  click_link "e-#{sale.id}"
end

Then("Eu vejo que a venda foi editada") do |sale.id|
  expect(page).to have_no_content(sale.id)
end