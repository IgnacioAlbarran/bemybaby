require "rails_helper"

RSpec.describe HeightsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/heights").to route_to("heights#index")
    end

    it "routes to #new" do
      expect(:get => "/heights/new").to route_to("heights#new")
    end

    it "routes to #show" do
      expect(:get => "/heights/1").to route_to("heights#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/heights/1/edit").to route_to("heights#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/heights").to route_to("heights#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/heights/1").to route_to("heights#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/heights/1").to route_to("heights#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/heights/1").to route_to("heights#destroy", :id => "1")
    end
  end
end
