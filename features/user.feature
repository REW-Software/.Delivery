Feature: User
  As a administrador do sistema .Delivery
  I want to adicionar, listar, atualizar, remover um usuario
  so that eu nao tenha que fazer isso manualmente

  Scenario: novo usuario
    Given Eu estou na pagina de usuarios
    When Eu clico em novo entregador
    And Eu preencho o formulario com name 'romulo', birth '12-05-2000', email 'joseromulo@hotmail.com', cpf '118.129.724-90', rg '555555', street 'Manoel Braga', number '162', tipo 'DeliveryMan', password '123456', password_confirmation '123456'
    And Eu clico em criar novo entregador
    Then Eu vejo que um novo usuario com name 'romulo', birth '2000-05-12', email 'joseromulo@hotmail.com', cpf '118.129.724-90', rg '555555', street 'Manoel Braga', number '162', tipo 'DeliveryMan' foi criado

  Scenario: novo usuario com email invalido
    Given Eu estou na pagina de usuarios
    When Eu clico em novo entregador
    And Eu preencho o formulario com name 'romulo', birth '12-05-2000', email 'joseromulo@hotmailcom', cpf '118.129.724-90', rg '555555', street 'Manoel Braga', number '162', tipo 'DeliveryMan', password '123456', password_confirmation '123456'
    And Eu clico em criar novo entregador
    Then Eu vejo uma mensagem de email invalido

  Scenario: novo usuario com cpf invalido
    Given Eu estou na pagina de usuarios
    When Eu clico em novo entregador
    And Eu preencho o formulario com name 'romulo', birth '12-05-2000', email 'joseromulo@hotmailcom', cpf '11812972490', rg '555555', street 'Manoel Braga', number '162', tipo 'DeliveryMan', password '123456', password_confirmation '123456'
    And Eu clico em criar novo entregador
    Then Eu vejo uma mensagem de cpf invalido

  Scenario: atualizar cpf do usuario
    Given Eu estou na pagina de usuarios
    And Eu crio um user valido com name 'romulo', birth '12-05-2000', email 'joseromulo@hotmail.com', cpf '118.129.724-90', rg '555555', street 'Manoel Braga', number '162', tipo 'DeliveryMan', password '123456', password_confirmation '123456'
    When Eu clico em editar usuario
    And Eu preencho o campo de cpf com '000.000.000-00'
    And Eu clico em atualizar usuario
    Then Eu vejo que o novo cpf é '000.000.000-00'

  Scenario: atualizar cpf do usuario com cpf invalido
    Given Eu estou na pagina de usuarios
    And Eu crio um user valido com name 'romulo', birth '12-05-2000', email 'joseromulo@hotmail.com', cpf '118.129.724-90', rg '555555', street 'Manoel Braga', number '162', tipo 'DeliveryMan', password '123456', password_confirmation '123456'
    When Eu clico em editar usuario
    And Eu preencho o campo de cpf com '00000000000'
    And Eu clico em atualizar usuario
    Then Eu vejo uma mensagem de cpf invalido