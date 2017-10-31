require "rails_helper"

RSpec.describe Player::BasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/player/bases").to route_to("player/bases#index")
    end

    it "routes to #new" do
      expect(:get => "/player/bases/new").to route_to("player/bases#new")
    end

    it "routes to #show" do
      expect(:get => "/player/bases/1").to route_to("player/bases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/player/bases/1/edit").to route_to("player/bases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/player/bases").to route_to("player/bases#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/player/bases/1").to route_to("player/bases#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/player/bases/1").to route_to("player/bases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/player/bases/1").to route_to("player/bases#destroy", :id => "1")
    end

  end
end
