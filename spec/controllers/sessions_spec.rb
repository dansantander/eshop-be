require 'rails_helper'

RSpec.describe 'Sessions', type: :request do

  it 'logs in a registered user' do
    post '/registrations', params: { user:
                                   {username: 'TestUser',
                                    email: 'testuser@email.com',
                                    password: '123456',
                                    password_confirmation: '123456'}}

    post '/sessions', params: { user:
                                   {password: '123456',
                                    email: 'testuser@email.com'}}

    data = JSON.parse(response.body)

    expect(data['status']).to include('created')
  end
end