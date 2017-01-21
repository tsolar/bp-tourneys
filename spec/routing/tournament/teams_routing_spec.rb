require "rails_helper"

RSpec.describe Tournament::TeamsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tournament/teams").to route_to("tournament/teams#index")
    end

    it "routes to #new" do
      expect(:get => "/tournament/teams/new").to route_to("tournament/teams#new")
    end

    it "routes to #show" do
      expect(:get => "/tournament/teams/1").to route_to("tournament/teams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tournament/teams/1/edit").to route_to("tournament/teams#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tournament/teams").to route_to("tournament/teams#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tournament/teams/1").to route_to("tournament/teams#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tournament/teams/1").to route_to("tournament/teams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tournament/teams/1").to route_to("tournament/teams#destroy", :id => "1")
    end

  end
end
