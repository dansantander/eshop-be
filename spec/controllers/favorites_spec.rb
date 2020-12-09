require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  let(:test_user) { User.create(username: 'TestUser', email: 'testuser@email.com') }
  let(:test_product1) { Product.create(name: 'TestProduct1', description: 'Product description 1', price: 12.99) }

  it 'adds a favorite product' do
    test_user
    test_product1
    post '/registrations', params: { user:
                                   { username: 'TestUser',
                                     email: 'testuser@email.com',
                                     password: '123456',
                                     password_confirmation: '123456' } }
    post '/favorites', params: { user_id: 1, product_id: test_product1.id }
    data = JSON.parse(response.body)

    expect(data['favProducts']).not_to be_nil
  end

  it 'returns a list of favorites product' do
    test_user
    test_product1
    post '/registrations', params: { user:
                                    { username: 'TestUser',
                                      email: 'testuser@email.com',
                                      password: '123456',
                                      password_confirmation: '123456' } }
    post '/favorites', params: { user_id: test_user.id, product_id: test_product1.id }

    get '/favorites'
    data = JSON.parse(response.body)

    expect(data['favProducts']).not_to be_nil
  end

  it 'deletes a favorite product form favorites' do
    test_user
    test_product1
    post '/registrations', params: { user:
                                   { username: 'TestUser',
                                     email: 'testuser@email.com',
                                     password: '123456',
                                     password_confirmation: '123456' } }
    post '/favorites', params: { user_id: test_user.id, product_id: test_product1.id }
    delete "/favorites/#{test_product1.id}"
    data = JSON.parse(response.body)

    expect(data['status']).to include('removed')
  end
end
