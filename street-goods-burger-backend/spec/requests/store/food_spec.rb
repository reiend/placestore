RSpec.describe 'FoodController', type: :request do
  let(:store) do
    Store.create(
      store_name: 'store',
      address: 'adress'
    )
  end

  let(:store_admin) do
    store.store_admins.create!(
      email: Faker::Internet.safe_email,
      password: Faker::Internet.password
    )
  end

  describe 'Post' do
    before(:each) do
      @store_admin = store.store_admins.create!(
        email: Faker::Internet.safe_email,
        password: Faker::Internet.password
      )
    end
    describe 'store/food/create' do
      it '1, if food params invalid raise an error' do
        @store_admin.confirm
        sign_in @store_admin

        post '/store/food/create'

        expect(JSON.parse(response.body)['status']).to (be == 400).or(be == 422)
      end
      it '2, if store admin not signin or email are not confirm don\'t create new food' do
        post '/store/food/create'

        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'Put' do
    before(:each) do
      @store_admin = store.store_admins.create!(
        email: Faker::Internet.safe_email,
        password: Faker::Internet.password
      )
    end
    describe 'store/food/update' do
      it '1, if food params invalid raise an error' do
        @store_admin.confirm
        sign_in @store_admin

        put '/store/food/update'

        expect(JSON.parse(response.body)['status']).to (be == 400).or(be == 422)
      end
      it '2, if store admin not signin or email are not confirm don\'t update the food' do
        post '/store/food/create'

        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'Delete' do
    before(:each) do
      @store_admin = store.store_admins.create!(
        email: Faker::Internet.safe_email,
        password: Faker::Internet.password
      )
    end
    describe 'store/food/delete' do
      it '1, if food params invalid raise an error' do
        @store_admin.confirm
        sign_in @store_admin

        delete '/store/food/delete'

        expect(JSON.parse(response.body)['status']).to (be == 400).or(be == 422)
      end
      it '2, if store admin not signin or email are not confirm don\'t delete the food' do
        post '/store/food/create'

        expect(response).to have_http_status(401)
      end
    end
  end
end
