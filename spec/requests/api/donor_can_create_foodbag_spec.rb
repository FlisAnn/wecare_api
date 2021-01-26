RSpec.describe 'POST /api/foodbags', type: :request do
  let(:donor_id) { create(:donor) }

  describe 'successfully create a foodbag' do
    before do
      post '/api/foodbags', {
        params: {
          foodbag: {
            pickuptime: :morning,
            status: :available,
            donor_id: :donor 
          }
        },
      }
    end
    
    it 'is expected to return a 201' do
      expect(response).to have_http_status 201
    end
    it 'is expected to return a success message' do
      expect(response_json['message']).to eq 'Your foodbag was successfully created!'
    end
      
  end
end
