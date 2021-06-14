When('Eu clico no {string}') do |link_name|
  click_link link_name
end

When('Eu clico em editar') do 
  click_link 'Editar'
end

When('Eu clico em deletar') do
  click_link 'Deletar'
end