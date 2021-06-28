Feature: Sale
  As a administrador do sistema .Delivery
  I want to adicionar, listar, remover uma venda
  so that eu nao tenha que fazer isso manualmente

Scenario: nova venda
  Given Eu estou logado como um administrador
  And Possui registrado um produto com name 'pizza de frango' e price '20.00' 
  And Eu estou na pagina de vendas
  When Eu clico em adicionar venda
  And Eu preencho com product 'pizza de frango', quantity '1', payment 'Dinheiro', client 'visitante', phone '11999991111', street 'rua principal' e number '01'
  And Eu clico em criar nova venda
  Then Eu vejo que uma venda com product 'pizza de frango', quantity '1', payment 'money', client 'visitante', phone '11999991111', street 'rua principal' e number '01'

Scenario: nova venda com quantidade 0 invalida
  Given Eu estou logado como um administrador
  And Possui registrado um produto com name 'pizza de frango' e price '20.00' 
  And Eu estou na pagina de vendas
  When Eu clico em adicionar venda
  And Eu preencho com product 'pizza de frango', quantity '0', payment 'Dinheiro', client 'visitante', phone '11999991111', street 'rua principal' e number '01'
  And Eu clico em criar nova venda
  Then Eu vejo uma mensagem com quantidade 0 invalida

Scenario: nova venda com quantidade vazia invalida
  Given Eu estou logado como um administrador
  And Possui registrado um produto com name 'pizza de frango' e price '20.00' 
  And Eu estou na pagina de vendas
  When Eu clico em adicionar venda
  And Eu preencho com product 'pizza de frango', quantity '', payment 'Dinheiro', client 'visitante', phone '11999991111', street 'rua principal' e number '01'
  And Eu clico em criar nova venda
  Then Eu vejo uma mensagem com quantiade nao pode ser vazio

Scenario: nova venda com cliente vazio invalido
  Given Eu estou logado como um administrador
  And Possui registrado um produto com name 'pizza de frango' e price '20.00' 
  And Eu estou na pagina de vendas
  When Eu clico em adicionar venda
  And Eu preencho com product 'pizza de frango', quantity '1', payment 'Dinheiro', client '', phone '11999991111', street 'rua principal' e number '01'
  And Eu clico em criar nova venda
  Then Eu vejo uma mensagem com cliente nao pode ser vazio

Scenario: nova venda com cliente vazio invalido
  Given Eu estou logado como um administrador
  And Possui registrado um produto com name 'pizza de frango' e price '20.00' 
  And Eu estou na pagina de vendas
  When Eu clico em adicionar venda
  And Eu preencho com product 'pizza de frango', quantity '1', payment 'Dinheiro', client 'visitante', phone '11999991111', street 'rua principal' e number ''
  And Eu clico em criar nova venda
  Then Eu vejo uma mensagem com numero nao pode ser vazio