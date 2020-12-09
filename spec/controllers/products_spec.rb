require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:test_product1) { Product.create(name: 'TestProduct1', description: 'Product description 1', price: 12.99) }

  it 'returns the list of all products' do
    test_product1
    get '/products'
    data = JSON.parse(response.body)

    expect(data['products']).not_to be_nil
  end

  it 'returns an specific product' do
    test_product1
    get "/products/#{test_product1.id}"
    data = JSON.parse(response.body)

    expect(data).not_to be_nil
  end
end