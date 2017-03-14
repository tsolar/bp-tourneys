require "rails_helper"

RSpec.describe Tournament::TeamsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tournaments/1/teams").to route_to("tournament/teams#index", tournament_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/tournaments/1/teams/new").to route_to("tournament/teams#new", tournament_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/tournaments/1/teams/2").to route_to("tournament/teams#show", tournament_id: "1", team_id: "2")
    end

    it "routes to #edit" do
      expect(:get => "/tournaments/1/teams/2/edit").to route_to("tournament/teams#edit", tournament_id: "1", team_id: "2")
    end

    it "routes to #create" do
      expect(:post => "/tournaments/1/teams").to route_to("tournament/teams#create", tournament_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tournaments/1/teams/2").to route_to("tournament/teams#update", tournament_id: "1", team_id: "2")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tournaments/1/teams/2").to route_to("tournament/teams#update", tournament_id: "1", team_id: "2")
    end

    it "routes to #destroy" do
      expect(:delete => "/tournaments/1/teams/2").to route_to("tournament/teams#destroy", tournament_id: "1", team_id: "2")
    end

  end
end
