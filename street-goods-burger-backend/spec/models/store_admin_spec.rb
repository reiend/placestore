require 'rails_helper'

RSpec.describe "StoreAdmin's Model", type: :model do
  describe 'Associations' do
    it '1, should belongs_to store' do
      store_admin = StoreAdmin.reflect_on_association(:store)
      expect(store_admin.macro).to eq(:belongs_to)
    end
  end
end
