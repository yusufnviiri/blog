require 'rails_helper'

RSpec.describe 'Posts+', type: :request do
  describe 'GET /index' do
    it 'renders the body template' do
      get '/users'
      expect(response.body).to include('Home')
    end
  end
end
