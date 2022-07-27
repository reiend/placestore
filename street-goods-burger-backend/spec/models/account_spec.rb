require 'rails_helper'

RSpec.describe "Account's Model", type: :model do
  let(:account) do
    Account.new(
      id: 1,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password
    )
  end

  describe 'Attributes' do
    describe 'first_name' do
      it '1, must be a String' do
        expect(account.first_name).to be_a String
      end
      it '2, must be not nil' do
        expect(account.first_name).to_not be nil
      end
      it '3, must be greater than 0 but less than 65' do
        expect(account.first_name.length).to (be >= 0).and(be <= 64)
      end
    end
    describe 'last_name' do
      it '1, must be a String' do
        expect(account.last_name).to be_a String
      end
      it '2, must be not nil' do
        expect(account.last_name).to_not be nil
      end
      it '3, must be greater than 0 but less than 65' do
        expect(account.last_name.length).to (be >= 0).and(be <= 64)
      end
    end

    describe 'is_ban' do
      it '1, must be a Boolean' do
        expect(account.is_ban).to be_in([true, false])
      end
      it '2, must be not nil' do
        expect(account.is_ban).to_not be nil
      end
      it '3, must be false upon creation' do
        expect(account.is_ban).to be_falsy
      end
    end

    describe 'warning' do
      it '1, must be an Integer' do
        expect(account.warning).to be_a_kind_of(Integer)
      end
      it '2, must be not nil' do
        expect(account.warning).to_not be nil
      end
      it '3, must be zero upon creation' do
        expect(account.warning).to be_zero
      end
    end
  end
end
