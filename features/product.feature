Feature: Product
  As a administrador do sistema .Delivery
  I want to adicionar, listar, atualizar, remover um produto
  so that eu nao tenha que fazer isso manualmente

Scenario: novo produto
  Given Eu estou na pagina de produtos
  When Eu clico em novo produto
  And Eu preencho o name com 'pizza de frango', o price '20.00'
  And Eu clico em criar novo produto
  Then Eu vejo que o novo produto foi criado

Scenario: novo produto com preço invalido
  Given Eu estou na pagina de produtos
  When Eu clico em novo produto
  And Eu preencho o name com 'pizza de frango', o price '20'
  And Eu clico em criar novo produto
  Then Eu vejo uma mensagem com preço invalido invalido

Scenario: novo produto com nome invalido
  Given Eu estou na pagina de produtos
  When Eu clico em novo produto
  And Eu preencho o name com '', o price '20.00'
  And Eu clico em criar novo produto
  Then Eu vejo uma mensagem com nome invalido invalido

Scenario: atualizar produto
  Given Eu estou na pagina de produtos
  When Eu clico em atualizar produto
  And Eu seleciono um produto
  And Eu preencho o name com 'frango com catupiry', o price com '25.00'
  And Eu clico em confirmar
  Then Eu vejo que o produto foi atualizado

Scenario: remover produto
  Given Eu estou na pagina de produtos
  When Eu clico em remover produto
  And Eu seleciono um produto
  Then Eu vejo que o produto foi removido