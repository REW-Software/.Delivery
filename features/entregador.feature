Feature: Funções de entregador
  As a Entregador do Ponto Delivery
  I want to visualizar minhas entregas, mudar status das minhas entregas, visualizar histórico de entregas atribuidas a mim
  So that eu possa trabalhar com o Ponto Delivery


  Scenario: Visualizar minhas entregas em aberto
    Given Possui registrado uma entrega com entregador 'deliveryMan' e status da entrega 'Em andamento'
    And Eu estou logado pelas credenciais email 'deliveryman@deliveryman.com' e senha 'deliveryman'
    When Eu estou na pagina home
    And Eu clico no 'Entregas abertas'
    Then Eu vejo que ha entregas na lista

  Scenario: Vizualizar minhas entregas concluidas
    Given Possui registrado uma entrega com entregador 'deliveryMan' e status da entrega 'Concluído'
    And Eu estou logado pelas credenciais email 'deliveryman@deliveryman.com' e senha 'deliveryman'
    When Eu estou na pagina home
    And Eu clico no 'Entregas concluidas'
    Then Eu vejo que ha entregas na lista


  Scenario: Alterar status da entrega para concluida
    Given Possui registrado uma entrega com entregador 'deliveryMan' e status da entrega 'Em andamento'
    And Eu estou logado pelas credenciais email 'deliveryman@deliveryman.com' e senha 'deliveryman'
    And Eu estou na pagina home
    When Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'deliveryMan'
    And Eu clico no 'Editar'
    And Eu troco o status para 'Concluído'
    Then Eu vejo que o status da entrega foi mudado para 'Concluído'

  Scenario: Alterar status da entrega para em andamento
    Given Possui registrado uma entrega com entregador 'deliveryMan' e status da entrega 'Concluído'
    And Eu estou logado pelas credenciais email 'deliveryman@deliveryman.com' e senha 'deliveryman'
    And Eu estou na pagina home
    When Eu clico no 'Entregas concluidas'
    And Eu clico na entrega com entregador 'deliveryMan'
    And Eu clico no 'Editar'
    And Eu troco o status para 'Em andamento'
    Then Eu vejo que o status da entrega foi mudado para 'Em andamento'

  Scenario: Visualizar horario que a entrega foi feita
    Given Possui registrado uma entrega com entregador 'deliveryMan' e status da entrega 'Em andamento'
    And Eu estou logado pelas credenciais email 'deliveryman@deliveryman.com' e senha 'deliveryman'
    When Eu estou na pagina home
    And Eu clico no 'Entregas abertas'
    And Eu clico na entrega com entregador 'deliveryMan'
    Then Eu vejo o horario de requisicao da entrega de entregador 'deliveryMan' e status 'Em andamento'