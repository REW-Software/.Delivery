Feature: Product
  As a administrador do sistema .Delivery
  I want to adicionar, listar, atualizar, remover um produto
  so that eu nao tenha que fazer isso manualmente

Scenario: novo produto
  Given Eu estou na pagina de produtos
  When Eu clico em novo produto
  And Eu preencho o name com 'pizza de frango', o price '20.00'
  And Eu clico em criar novo produto
  Then Eu vejo um produto com name 'pizza de frango' e price '20.00'

Scenario: novo produto com price nao numero
  Given Eu estou na pagina de produtos
  When Eu clico em novo produto
  And Eu preencho o name com 'pizza de frango', o price 'abc'
  And Eu clico em criar novo produto
  Then Eu vejo uma mensagem com price nao e um numero

Scenario: novo produto com nome invalido
  Given Eu estou na pagina de produtos
  When Eu clico em novo produto
  And Eu preencho o name com '', o price '20.00'
  And Eu clico em criar novo produto
  Then Eu vejo uma mensagem com nome nao pode ser vazio

Scenario: atualizar produto
  Given Possui registrado um produto com name 'pizza de frango' e price '20.00'
  And Eu estou na pagina de produtos
  When Eu clico no 'pizza de frango'
  And Eu clico em editar produto
  And Eu preencho o name com 'frango com catupiry', o price '25.00'
  And Eu clico em atualizar produto
  Then Eu nao vejo um produto com name 'pizza de frango' e price '20.00'
  And Eu vejo um produto com name 'frango com catupiry' e price '25.00'

Scenario: deletar produto
  Given Possui registrado um produto com name 'pizza de frango' e price '20.00'
  And Eu estou na pagina de produtos
  When Eu clico no 'pizza de frango'
  And Eu clico em deletar produto
  Then Eu nao vejo um produto com name 'pizza de frango' e price '20.00'