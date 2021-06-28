Feature: User
  As a administrador do sistema .Delivery
  I want to adicionar, listar, atualizar, remover um usuario
  so that eu nao tenha que fazer isso manualmente

  Scenario: novo usuario
    Given Eu estou na pagina de novo usuario
    When Eu preencho o formulario com nome 'romulo', nascimento '12-05-2000', email 'joseromulo@hotmail.com', cpf '118.129.724-90', rg '555555', rua 'Manoel Braga', numero da casa '162', perfil de usuario 'DeliveryMan', senha '123456', confirmacao de senha '123456'
    And Eu clico em criar usuario
    And Eu logo com email 'joseromulo@hotmail.com' e senha '123456'
    Then Eu vejo que um novo usuario com nome 'romulo', nascimento '2000-05-12', email 'joseromulo@hotmail.com', cpf '118.129.724-90', rg '555555', rua 'Manoel Braga', numero da casa '162', perfil de usuario 'DeliveryMan' foi criado

  Scenario: novo usuario com email invalido
    Given Eu estou na pagina de novo usuario
    When Eu preencho o formulario com nome 'romulo', nascimento '12-05-2000', email 'joseromulo@hotmailcom', cpf '118.129.724-90', rg '555555', rua 'Manoel Braga', numero da casa '162', perfil de usuario 'DeliveryMan', senha '123456', confirmacao de senha '123456'
    And Eu clico em criar usuario
    Then Eu vejo uma mensagem de email invalido

  Scenario: novo usuario com cpf invalido
    Given Eu estou na pagina de novo usuario
    When Eu preencho o formulario com nome 'romulo', nascimento '12-05-2000', email 'joseromulo@hotmail.com', cpf '11812972490', rg '555555', rua 'Manoel Braga', numero da casa '162', perfil de usuario 'DeliveryMan', senha '123456', confirmacao de senha '123456'
    And Eu clico em criar usuario
    Then Eu vejo uma mensagem de cpf invalido

  Scenario: atualizar cpf do usuario
    Given Eu estou logado como um administrador
    And Eu estou na pagina de perfil
    When Eu clico em editar usuario
    And Eu preencho senha e confirmação de senha com os dados do administrador
    And Eu preencho o campo de cpf com '000.000.000-00'
    And Eu clico em atualizar usuario
    Then Eu vejo que o novo cpf é '000.000.000-00'

  Scenario: atualizar cpf do usuario com cpf invalido
    Given Eu estou logado como um administrador
    And Eu estou na pagina de perfil
    When Eu clico em editar usuario
    And Eu preencho senha e confirmação de senha com os dados do administrador
    And Eu preencho o campo de cpf com '00000000000'
    And Eu clico em atualizar usuario
    Then Eu vejo uma mensagem de cpf invalido