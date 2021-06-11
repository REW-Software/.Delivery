Feature: Sale
  As a administrador do sistema .Delivery
  I want to adicionar, listar, remover uma venda
  so that eu nao tenha que fazer isso manualmente

Scenario: nova venda
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar vendas
  When Eu clico em nova venda
  And Eu preencho o name do produto 'pizza de frango', a quantity do produto '1', a payment_type 'money', name_client 'visitante', phone_client '11999991111', a street 'rua principal', o number '01'
  And Eu clico em criar nova venda
  Then Eu vejo que uma nova venda foi criada

Scenario: nova venda com nome do produto invalido
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar vendas
  When Eu clico em nova venda
  And Eu preencho o name do produto '', a quantity do produto '1',  name_client 'visitante', phone_client '11999991111', a street 'rua principal', o number '01', a payment_type 'money'
  And Eu clico em criar nova venda
  Then Eu vejo uma mensagem dados invalidos

Scenario: nova venda com quantidade invalida
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar vendas
  When Eu clico em nova venda
  And Eu preencho o name do produto 'pizza de frango', a quantity do produto '', name_client 'visitante', phone_client '11999991111', a street 'rua principal', o number '01', a payment_type 'money'
  And Eu clico em criar nova venda
  Then Eu vejo uma mensagem dados invalidos

Scenario: remover venda
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar vendas
  When Eu clico em remover venda
  Then Eu vejo que a venda foi removida

Scenario: editar uma venda
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar vendas
  When Eu clico em editar venda
  Then Eu vejo que a venda foi editada