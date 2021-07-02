Feature: User
  As a administrador do sistema .Delivery
  I want to adicionar, listar, atualizar, remover um usuario
  so that eu nao tenha que fazer isso manualmente

  Scenario: novo usuario
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Eu estou na pagina de novo usuario
    When Eu preencho o formulario com nome 'Gustavo', nascimento '2000/12/05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456' e confirmacao de senha '123456'
    And Eu clico no botao 'Criar Usuário'
    Then Eu vejo que o usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan' esta na lista de usuarios

  Scenario: novo usuario com email invalido
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Eu estou na pagina de novo usuario
    When Eu preencho o formulario com nome 'Gustavo', nascimento '2000/12/05', email 'gustavo', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456' e confirmacao de senha '123456'
    And Eu clico no botao 'Criar Usuário'
    Then Eu vejo uma mensagem de email invalido

  Scenario: novo usuario com cpf invalido
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Eu estou na pagina de novo usuario
    When Eu preencho o formulario com nome 'Gustavo', nascimento '2000/12/05', email 'gustavo@mail.com', cpf '1', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456' e confirmacao de senha '123456'
    And Eu clico no botao 'Criar Usuário'
    Then Eu vejo uma mensagem de cpf invalido

  @selenium
  Scenario: deletar usuario
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Eu estou na pagina de usuarios
    When Eu clico no 'Gustavo'
    And Eu clico no 'Deletar'
    And Eu confirmo a acao
    Then Eu vejo que o usuario de nome 'Gustavo' e cpf '346.475.260-70' nao esta na lista de usuarios

  Scenario: atualizar informacoes de usuario
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Eu estou na pagina de usuarios
    When Eu clico no 'Gustavo'
    And Eu clico no 'Editar'
    And Eu preencho o formulario com nome 'Gust', nascimento '2000-12-06', email 'gust@mail.com', cpf '398.004.310-04', rg '443793657', perfil de usuario 'DeliveryMan', senha '654321' e confirmacao de senha '654321'
    And Eu clico no botao 'Atualizar Usuário'
    Then Eu vejo que o usuario com nome 'Gust', nascimento '2000-12-06', email 'gust@mail.com', cpf '398.004.310-04', rg '443793657', perfil de usuario 'DeliveryMan' esta na lista de usuarios