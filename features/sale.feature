Feature: Sale
  As a administrador do sistema .Delivery
  I want to adicionar, listar, remover, atualizar e ver uma venda
  so that eu nao tenha que fazer isso manualmente

  Scenario: nova venda
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado um usuario com nome 'João', nascimento '1986-05-01', email 'jao@mail.com', cpf '018.046.410-81', rg '123465941', perfil de usuario 'Cliente', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'Gustavo'
    And Eu clico no 'Adicionar venda'
    And Eu preencho cliente 'João' e pagamento 'Dinheiro'
    And Eu clico no botao 'Criar Venda'
    And Eu clico no 'Vizualizar detalhes de venda'
    Then Eu vejo uma venda com o cliente 'João' e pagamento 'Em dinheiro'

  Scenario: listar vendas
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado um usuario com nome 'João', nascimento '1986-05-01', email 'jao@mail.com', cpf '018.046.410-81', rg '123465941', perfil de usuario 'Cliente', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Tem registrado uma venda com o entregador 'Gustavo' para o cliente 'João' em 'Dinheiro'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'Gustavo'
    Then Eu vejo que ha vendas na lista

  @selenium
  Scenario: remover venda
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado um usuario com nome 'João', nascimento '1986-05-01', email 'jao@mail.com', cpf '018.046.410-81', rg '123465941', perfil de usuario 'Cliente', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Tem registrado uma venda com o entregador 'Gustavo' para o cliente 'João' em 'Dinheiro'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'Gustavo'
    And Eu clico na venda com cliente 'João'
    And Eu clico no 'Deletar'
    And Eu confirmo a acao
    Then Eu vejo que a venda com entregador 'Gustavo' para o cliente 'João' nao esta na lista

  Scenario: atualizar venda
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado um usuario com nome 'João', nascimento '1986-05-01', email 'jao@mail.com', cpf '018.046.410-81', rg '123465941', perfil de usuario 'Cliente', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Tem registrado uma venda com o entregador 'Gustavo' para o cliente 'João' em 'Dinheiro'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'Gustavo'
    And Eu clico na venda com cliente 'João'
    And Eu clico no 'Editar'
    And Eu preencho cliente 'João' e pagamento 'Cartão'
    And Eu clico no botao 'Atualizar Venda'
    Then Eu vejo uma venda com o cliente 'João' e pagamento 'No cartão'
  
  Scenario: visualizar venda
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado um usuario com nome 'João', nascimento '1986-05-01', email 'jao@mail.com', cpf '018.046.410-81', rg '123465941', perfil de usuario 'Cliente', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Tem registrado uma venda com o entregador 'Gustavo' para o cliente 'João' em 'Dinheiro'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'Gustavo'
    And Eu clico na venda com cliente 'João'
    Then Eu vejo uma venda com o cliente 'João' e pagamento 'Em dinheiro'