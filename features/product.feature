Feature: Product
  As a administrador do sistema .Delivery
  I want to adicionar, listar, atualizar, remover e ver um produto
  so that eu nao tenha que fazer isso manualmente

  Scenario: novo produto
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
    And Eu clico no "Adicionar produto na venda"
    And Eu preencho nome do produto 'Pizza de Frango', preco '15', desconto '1' e quantidade '2'
    And Eu clico no botao 'Criar'
    Then Eu vejo um produto com nome 'Pizza de Frango' e '2' unidades
    And Eu vejo preco total de '28'

  Scenario: listar produtos
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado um usuario com nome 'João', nascimento '1986-05-01', email 'jao@mail.com', cpf '018.046.410-81', rg '123465941', perfil de usuario 'Cliente', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Tem registrado uma venda com o entregador 'Gustavo' para o cliente 'João' em 'Dinheiro'
    And Tem registrado um produto com nome 'Pizza de Frango', preco '15', desconto '0' e quantidade '2' na venda do entregador 'Gustavo' para o cliente 'João'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'Gustavo'
    And Eu clico na venda com cliente 'João'
    Then Eu vejo que ha produtos na lista

  Scenario: atualizar produto
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado um usuario com nome 'João', nascimento '1986-05-01', email 'jao@mail.com', cpf '018.046.410-81', rg '123465941', perfil de usuario 'Cliente', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Tem registrado uma venda com o entregador 'Gustavo' para o cliente 'João' em 'Dinheiro'
    And Tem registrado um produto com nome 'Pizza de Frango', preco '15', desconto '0' e quantidade '2' na venda do entregador 'Gustavo' para o cliente 'João'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'Gustavo'
    And Eu clico na venda com cliente 'João'
    And Eu clico no 'Pizza de Frango'
    And Eu clico no 'Editar'
    And Eu preencho nome do produto 'Pizza de Calabresa', preco '16', desconto '2' e quantidade '3'
    And Eu clico no botao 'Salvar'
    Then Eu vejo um produto com nome 'Pizza de Calabresa' e '3' unidades
    And Eu vejo preco total de '42'

  @selenium
  Scenario: deletar produto
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado um usuario com nome 'João', nascimento '1986-05-01', email 'jao@mail.com', cpf '018.046.410-81', rg '123465941', perfil de usuario 'Cliente', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Tem registrado uma venda com o entregador 'Gustavo' para o cliente 'João' em 'Dinheiro'
    And Tem registrado um produto com nome 'Pizza de Frango', preco '15', desconto '0' e quantidade '2' na venda do entregador 'Gustavo' para o cliente 'João'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'Gustavo'
    And Eu clico na venda com cliente 'João'
    And Eu clico no 'Pizza de Frango'
    And Eu clico no 'Deletar'
    And Eu confirmo a acao
    Then Eu nao vejo um produto com nome 'Pizza de Frango'
    And Eu vejo preco total de '0'

  Scenario: ver produto
    Given Eu estou logado pelas credenciais email 'admin@admin.com' e senha 'admin1'
    And Tem registrado um usuario com nome 'Gustavo', nascimento '2000-12-05', email 'gustavo@mail.com', cpf '346.475.260-70', rg '175399694', perfil de usuario 'DeliveryMan', senha '123456'
    And Tem registrado um usuario com nome 'João', nascimento '1986-05-01', email 'jao@mail.com', cpf '018.046.410-81', rg '123465941', perfil de usuario 'Cliente', senha '123456'
    And Tem registrado uma entrega com entregador 'Gustavo' e status da entrega 'Em andamento'
    And Tem registrado uma venda com o entregador 'Gustavo' para o cliente 'João' em 'Dinheiro'
    And Tem registrado um produto com nome 'Pizza de Frango', preco '15', desconto '0' e quantidade '2' na venda do entregador 'Gustavo' para o cliente 'João'
    And Eu estou na pagina home
    When Eu clico no 'Entregas'
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'Gustavo'
    And Eu clico na venda com cliente 'João'
    And Eu clico no 'Pizza de Frango'
    Then Eu vejo um produto com nome 'Pizza de Frango', preco '15', desconto '0' e quantidade '2'