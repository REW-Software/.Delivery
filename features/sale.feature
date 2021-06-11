Feature: Sale
  As a administrador do sistema .Delivery
  I want to adicionar, listar, remover uma venda
  so that eu nao tenha que fazer isso manualmente

Scenario: nova venda
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar vendas
  When Eu clico em nova venda
  And Eu preencho o name do produto 'pizza de frango', a quantity do produto '1', a street 'rua principal', o number '01', a payment_type 'money', name_client 'visitante', phone_client '11999991111'
  And Eu clico em criar nova venda
  Then Eu vejo que uma nova venda foi criada e vejo o preço total

Scenario: nova venda com nome do produto invalido
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar vendasWhen Eu clico em nova venda
  And Eu preencho o name do produto '', a quantity do produto '1', a street 'rua principal', o number '01', a payment_type 'money', name_client 'visitante', phone_client '11999991111'
  And Eu clico em criar nova venda
  Then Eu vejo uma mensagem dados invalidos

Scenario: nova venda com quantidade invalida
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar vendas
  When Eu clico em nova venda
  And Eu preencho o name do produto 'pizza de frango', a quantity do produto '', a street 'rua principal', o number '01', a payment_type 'money', name_client 'visitante', phone_client '11999991111'
  And Eu clico em criar nova venda
  Then Eu vejo uma mensagem dados invalidos

Scenario: remover venda
  Given Um usuario administrador existente com o name 'admin', o email 'admin@email.com'
  And Eu estou logado como administrador com o email 'admin@email.com' e com password 'admin123'
  And Eu estou na pagina administrar vendas
  When Eu clico em remover venda
  Then Eu vejo que o produto foi removido