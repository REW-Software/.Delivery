Feature: Accesso
  As a Usuario do Ponto Delivery
  I want to me registrar, fazer login, fazer logout, excluir minha conta
  So that eu possa acessar as funcionalidades do sistema atribuidas ou meu perfil de usuário

  Scenario: Registrar usuario
    Given Eu estou na pagina de login
    When Eu clico no 'Se inscreva agora!'
    And Eu preencho o formulario com nome 'Gustavo', nascimento '01-01-2000', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456' e confirmacao de senha '123456'
    And Eu clico no botao 'Criar Usuário'
    Then Eu vejo que estou na pagina de login

  Scenario: Registrar invalido
    Given Eu estou na pagina de login
    When Eu clico no 'Se inscreva agora!'
    And Eu preencho o formulario com nome 'Gustavo', nascimento '01-01-2000', email 'gustavo', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456' e confirmacao de senha '123456'
    And Eu clico no botao 'Criar Usuário'
    Then Eu vejo uma mensagem de email invalido

  Scenario: Login
    Given Tem registrado um usuario com nome 'Gustavo', nascimento '01-01-2000', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Eu estou na pagina de login
    When Eu preencho email 'gustavo@mail.com' e senha '123456'
    And Eu clico no botao 'Entrar'
    Then Eu vejo que estou na pagina de perfil do usuario 'Gustavo'

  Scenario: Logout
    Given Tem registrado um usuario com nome 'Gustavo', nascimento '2000-01-01', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Eu estou logado pelas credenciais email 'gustavo@mail.com' e senha '123456'
    And Eu estou na pagina home
    When Eu clico no 'Sair'
    Then Eu vejo que estou na pagina de login

  @selenium
  Scenario: Excluir conta
    Given Tem registrado um usuario com nome 'Gustavo', nascimento '2000-01-01', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Eu estou logado pelas credenciais email 'gustavo@mail.com' e senha '123456'
    And Eu estou na pagina home
    When Eu clico no 'Perfil'
    And  Eu clico no 'Deletar'
    And Eu confirmo a acao
    Then Eu vejo que estou na pagina de login