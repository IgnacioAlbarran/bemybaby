require "rails_helper"

RSpec.describe BabiesController, type: :routing do
  describe "routing" do
    let!(:current_user) { create(:user, id: 1, name: 'Usuario', last_name: 'Ficticio', email: 'periccco@palotes') }
    let!(:current_baby) { create(:baby, id: 2, user_id: 1) }

    it "routes to #index" do
      expect(:get => "/users/1/babies").to route_to("babies#index", "user_id"=>"1")
    end

    it "routes to #new" do
      expect(:get => "users/1/babies/new").to route_to("babies#new", "user_id"=>"1")
    end

    it "routes to #show" do
      expect(:get => "/users/1/babies/1").to route_to("babies#show", :user_id => "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "users/1/babies/1/edit").to route_to("babies#edit", :user_id => '1', :id => "1")
    end

    it "routes to #create" do
      expect(:post => "users/1/babies").to route_to("babies#create", :user_id => '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "users/1/babies/1").to route_to("babies#update", :user_id => '1', :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "users/1/babies/1").to route_to("babies#update", :user_id => '1', :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "users/1/babies/1").to route_to("babies#destroy", :user_id => '1', :id => "1")
    end
  end
end
