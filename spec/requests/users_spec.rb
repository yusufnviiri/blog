require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'renders the body template' do
      get '/users'
      expect(response.body).to include('Home')
    end
  end
end
