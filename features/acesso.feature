Feature: Session
  As a Usuario do Ponto Delivery
  I want to me registrar, fazer login, fazer logout, excluir minha conta
  So that eu possa acessar as funcionalidades do sistema atribuidas ou meu perfil de usuário

  Scenario: nova sessão
    Given Possui registrado um usuario com email '420@mail.com' e senha 'senha420'
    And Eu estou na pagina de login
    When Eu preencho o email '420@mail.com', e senha 'senha420'
    And Eu clico em entrar
    Then Eu vejo que estou na pagina de perfil do usuario
  
  Scenario: nova sessão invalida por email
    Given Possui registrado um usuario com email '420@mail.com' e senha 'senha420'
    And Eu estou na pagina de login
    When Eu preencho o email '420@mailcom', e senha 'senha420'
    And Eu clico em entrar
    Then Eu vejo que estou na pagina de login

  Scenario: nova sessão invalida por senha
    Given Possui registrado um usuario com email '420@mail.com' e senha 'senha420'
    And Eu estou na pagina de login
    When Eu preencho o email '420@mail.com', e senha 'senha421'
    And Eu clico em entrar
    Then Eu vejo que estou na pagina de login

  Scenario: nova sessão invalida por usuario inexistente
    And Eu estou na pagina de login
    When Eu preencho o email '420@mail.com', e senha 'senha420'
    And Eu clico em entrar
    Then Eu vejo que estou na pagina de login

  Scenario: finalizar sessão
    Given Eu estou logado
    When Eu clico em sair
    Then Eu vejo que estou na pagina de login