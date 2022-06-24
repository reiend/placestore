RSpec.describe 'StoreAdmin/AddNewFood Controller', type: :request do
  describe 'Post' do
    describe 'store/food' do
      before(:each) do
        store = Store.create(
          store_name: 'store',
          address: 'adress'
        )
        get '/store/food', params: {
          food: {
            store_id: -1
          }
        }
      end

      it '1, invalid params info should raise an error' do
        expect(JSON.parse(response.body)['status']).to (be == 400).or(be == 422)
      end
    end
  end
end
