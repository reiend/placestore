RSpec.describe 'FoodController', type: :request do
  describe 'Get' do
    describe 'store/foods' do
      let(:store) do
        Store.create(
          store_name: 'store',
          address: 'adress'
        )
      end

      it '1, if store can\'t found raise an error' do
        get '/store/food', params: {
          food: {
            store_id: -1
          }
        }
        expect(JSON.parse(response.body)['status']).to (be == 400).or(be == 422)
      end

      it '1, if store found respond success' do
        get '/store/food', params: {
          food: {
            store_id: store.id
          }
        }
        expect(JSON.parse(response.body)['status']).to be == 200
      end
      it '1, if store found respond data should not be nil' do
        get '/store/food', params: {
          food: {
            store_id: store.id
          }
        }
        expect(JSON.parse(response.body)['data']).to_not be_nil
      end
    end
  end
end
