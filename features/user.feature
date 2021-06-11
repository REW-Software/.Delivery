Feature: User
  As a administrador do sistema .Delivery
  I want to adicionar, listar, atualizar, remover um usuario
  so that eu nao tenha que fazer isso manualmente

Scenario: novo usuario do tipo delivery_man
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar entregador
  When Eu clico em novo entregador
  And Eu preencho o name com 'entregador', o email 'entregador@email.com', o password com 'senha123', o password_confirmation com 'senha123', a birth_date com '1990-01-01', o cpf com '123.456.789-00', o rg com '1000000', o street 'rua principal', o number '01'
  And Eu clico em criar novo entregador
  Then Eu vejo que o novo usuario foi criado

Scenario: novo usuario do tipo delivery_man com email invalido
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar entregador
  When Eu clico em novo entregador
  And Eu preencho o name com 'entregador', o email 'entregadoremail.com', o password com 'senha123', o password_confirmation com 'senha123', a birth_date com '1990-01-01', o cpf com '123.456.789-00', o rg com '1000000', o street 'rua principal', o number '01'
  And Eu clico em criar novo entregador
  Then Eu vejo uma mensagem com email invalido

Scenario: novo usuario do tipo delivery_man com password invalido
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar entregador
  When Eu clico em novo entregador
  And Eu preencho o name com 'entregador', o email 'entregador@email.com', o password com '123', o password_confirmation com '123', a birth_date com '1990-01-01', o cpf com '123.456.789-00', o rg com '1000000', o street 'rua principal', o number '01'
  And Eu clico em criar novo entregador
  Then Eu vejo uma mensagem com senha invalida

Scenario: atualizar senha do usuario do tipo delivery_man
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar entregador
  When Eu clico em atualizar entregador
  And Eu seleciono o campo password
  And Eu preencho o password com '123senha', o password_confirmation com '123senha'
  And Eu clico em confirmar
  Then Eu vejo que a senha foi atualizada
  
Scenario: atualizar senha do usuario do tipo delivery_man invalida
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar entregador
  When Eu clico em atualizar entregador
  And Eu seleciono o campo password
  And Eu preencho o password com '', o password_confirmation com ''
  And Eu clico em confirmar
  Then Eu vejo uma mensagem dados invalidos