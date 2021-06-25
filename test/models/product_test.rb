require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "Criar Product" do
    product = Product.new(name: 'ProdutoLegal', price: 1.00)
    assert product.save
  end

  test "Modificar produto" do
    product = Product.new(name: 'ProdutoLegal', price: 1.00)
    assert product.save
    assert product.update(name: 'ProdutoLegalModificado', price: 2.00)
  end

  test "Destruir produto" do 
    product = Product.new(name: 'ProdutoLegal', price: 1.00)
    assert product.save
    assert product.destroy
  end

  test "Criar produto com price invalido" do
    product = Product.new(name: 'ProdutoLegal', price: 'abc')
    assert_not product.save
  end

  test "Criar produto com name invalido" do
    product = Product.new(price: 1.00)
    assert_not product.save
  end

  test "Criar produto sem parametros" do
    product = Product.new()
    assert_not product.save
  end
end
