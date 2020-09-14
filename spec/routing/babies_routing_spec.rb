require "rails_helper"

RSpec.describe BabiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/babies").to route_to("babies#index")
    end

    it "routes to #new" do
      expect(:get => "/babies/new").to route_to("babies#new")
    end

    it "routes to #show" do
      expect(:get => "/babies/1").to route_to("babies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/babies/1/edit").to route_to("babies#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/babies").to route_to("babies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/babies/1").to route_to("babies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/babies/1").to route_to("babies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/babies/1").to route_to("babies#destroy", :id => "1")
    end
  end
end
