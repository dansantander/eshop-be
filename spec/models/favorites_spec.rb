require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:test_user) { User.create(username: 'TestUser', email: 'testuser@email.com') }
  let(:test_product1) { Product.create(name: 'TestProduct1', description: 'Product description 1', price: 12.99) }
  let(:favorite) { Favorite.create(user_id: test_user.id, product_id: test_product1.id) }

  it 'should be associated with user and place' do
    test_user
    test_product1
    expect(favorite.user_id).to eq(test_user.id)
    expect(favorite.product_id).to eq(test_product1.id)
  end
end
