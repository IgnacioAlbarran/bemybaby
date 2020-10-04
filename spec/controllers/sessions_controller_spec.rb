require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response.status).to eq(302)
      expect(response.location).to eq('http://test.host/new_session')
    end
  end

  describe "GET #welcome" do
    it "returns http success" do
      get :welcome
      expect(response).to have_http_status(:success)
    end
  end

  describe 'get #close_session' do
    it 'closses session and redirects to welcome' do
      get :close_session
      expect(response.status).to eq(302)
      expect(response.location).to eq('http://test.host/')
    end
  end
end
