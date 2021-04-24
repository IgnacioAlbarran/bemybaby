require "rails_helper"

RSpec.describe CheckupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/checkups").to route_to("checkups#index")
    end

    it "routes to #new" do
      expect(:get => "/checkups/new").to route_to("checkups#new")
    end

    it "routes to #show" do
      expect(:get => "/checkups/1").to route_to("checkups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/checkups/1/edit").to route_to("checkups#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/checkups").to route_to("checkups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/checkups/1").to route_to("checkups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/checkups/1").to route_to("checkups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/checkups/1").to route_to("checkups#destroy", :id => "1")
    end
  end
end
