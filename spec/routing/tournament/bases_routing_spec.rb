require "rails_helper"

RSpec.describe Tournament::BasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tournament/bases").to route_to("tournament/bases#index")
    end

    it "routes to #new" do
      expect(:get => "/tournament/bases/new").to route_to("tournament/bases#new")
    end

    it "routes to #show" do
      expect(:get => "/tournament/bases/1").to route_to("tournament/bases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tournament/bases/1/edit").to route_to("tournament/bases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tournament/bases").to route_to("tournament/bases#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tournament/bases/1").to route_to("tournament/bases#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tournament/bases/1").to route_to("tournament/bases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tournament/bases/1").to route_to("tournament/bases#destroy", :id => "1")
    end

  end
end
