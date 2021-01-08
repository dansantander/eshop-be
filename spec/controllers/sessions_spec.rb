require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  it 'logs in a registered user' do
    post '/registrations', params: { registration:
                                   { username: 'TestUser',
                                     email: 'testuser@email.com',
                                     password: '123456',
                                     password_confirmation: '123456' } }

    post '/sessions', params: { session:
                                   { password: '123456',
                                     email: 'testuser@email.com' } }

    data = JSON.parse(response.body)

    expect(data['logged_in']).to be(true)
  end
end
