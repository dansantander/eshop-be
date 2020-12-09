require 'rails_helper'

RSpec.describe 'Registrations', type: :request do

  it 'registers a new user' do
    post '/registrations', params: { user:
                                   {username: 'TestUser',
                                    email: 'testuser@email.com',
                                    password: '123456',
                                    password_confirmation: '123456'}}
    data = JSON.parse(response.body)

    expect(data['status']).to include('created')
  end
end