Feature: Post
  As a administrador do sistema .Delivery
  I want to atribuir entrega ao entregador, mudar status da entrega, listar entregas
  so that eu possa gerenciar as entregas

Scenario: nova entrega
  Given Eu estou logado como um administrador
  And Possui registrado uma entrega com id da venda '1', o entregador 'usuario_entregador' e status 'em andamento'
  And Eu estou na pagina de entregas
  When Eu clico em adicionar entrega
  And Eu preencho com entrega com id da venda '1', o entregador 'usuario_entregador' e status 'em andamento'
  And Eu clico em criar nova entrega
  Then Eu vejo que uma entrega com venda '1', o entregador 'usuario_entregador' e status 'em andamento'

Scenario: listar entregas
  Given Eu estou logado como um administrador
  When Eu clico em entregas
  Then Eu vejo as todas as entregas

Scenario: atualizar entregador do entrega
  Given Eu estou logado como um administrador
  And Eu estou na pagina de uma entrega
  When Eu clico em editar entregador
  And Eu mudo o entregador da entrega 
  And Eu clico em atualizar entrega
  Then Eu vejo que o entregador foi modificado

Scenario: atualizar status do entrega para em andamento
  Given Eu estou logado como um administrador
  And Eu estou na pagina de uma entrega
  When Eu clico em editar entrega
  And Eu mudo o status da entrega para em andamento
  And Eu clico em atualizar entrega
  Then Eu vejo que o status foi modificado

Scenario: atualizar status do entrega para concluido
  Given Eu estou logado como um administrador
  And Eu estou na pagina de uma entrega
  When Eu clico em editar entrega
  And Eu mudo o status da entrega para concluido
  And Eu clico em atualizar entrega
  Then Eu vejo que o status foi modificado

