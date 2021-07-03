Feature: Post
  As a administrador do sistema .Delivery
  I want to atribuir entrega ao entregador, mudar status da entrega, listar entregas
  so that eu possa gerenciar as entregas

  Scenario: Criar entrega
    Given Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Adicionar entrega'
    And Eu preencho entregador 'Gustavo' e status da entrega 'Em andamento'
    And Eu clico no botao 'Criar Entrega'
    Then Eu vejo uma entrega com o entregador 'Gustavo' e status da entrega 'Em andamento'

  Scenario: Mudar status da entrega
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'Gustavo'
    And Eu clico no 'Editar'
    And Eu preencho entregador 'Gustavo' e status da entrega 'Concluído'
    And Eu clico no botao 'Atualizar entrega'
    Then Eu vejo uma entrega com o entregador 'Gustavo' e status da entrega 'Concluído'
  
  Scenario: Listar entregas concluidas
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Concluído'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas concluidas'
    Then Eu vejo que ha entregas na lista

  Scenario: Listar entregas em andamento
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    Then Eu vejo que ha entregas na lista

  Scenario: Mudar entregador
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado um usuario com nome 'João', nascimento '1986-05-01', email 'jao@mail.com', cpf '018.046.410-81', rg '123465941', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'Gustavo'
    And Eu clico no 'Editar'
    And Eu preencho entregador 'João' e status da entrega 'Em andamento'
    And Eu clico no botao 'Atualizar entrega'
    Then Eu vejo uma entrega com o entregador 'João' e status da entrega 'Em andamento'