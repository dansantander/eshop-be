require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  let(:test_product1) { Product.create(name: 'TestProduct1', description: 'Product description 1', price: 12.99) }

  it 'returns a list of favorites product' do
    test_product1
    post '/registrations', params:  { registration:
                                    { username: 'TestUser',
                                      email: 'testuser@email.com',
                                      password: '123456',
                                      password_confirmation: '123456' } }

    user = User.first
    post '/favorites', params: {
      product_id: test_product1.id,
      user: user.id
    }

    get '/favorites', params: { user: user.id }
    data = JSON.parse(response.body)

    expect(data['favProducts']).not_to be_nil
  end

  it 'adds a favorite product' do
    test_product1
    post '/registrations', params: { registration:
                                   { username: 'TestUser',
                                     email: 'testuser@email.com',
                                     password: '123456',
                                     password_confirmation: '123456' } }
    user = User.last

    post '/favorites', params: { 
          product_id: test_product1.id,
          user: user.id
    }

    data = JSON.parse(response.body)

    expect(data['favProducts']).not_to be_nil
  end

  it 'deletes a favorite product form favorites' do
    test_product1
    post '/registrations', params: { registration:
                                   { username: 'TestUser',
                                     email: 'testuser@email.com',
                                     password: '123456',
                                     password_confirmation: '123456' } }
    user = User.last

    post '/favorites', params: { 
      product_id: test_product1.id,
      user: user.id
    }

    delete "/favorites/#{test_product1.id}", env: { 'RAW_POST_DATA' => user.id.to_s }

    data = JSON.parse(response.body)

    expect(data['success']).to include('Product removed from Favorites')
  end
end
