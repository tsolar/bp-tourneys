require "rails_helper"

RSpec.describe Team::BasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/team/bases").to route_to("team/bases#index")
    end

    it "routes to #new" do
      expect(get: "/team/bases/new").to route_to("team/bases#new")
    end

    it "routes to #show" do
      expect(get: "/team/bases/1").to route_to("team/bases#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/team/bases/1/edit").to route_to("team/bases#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/team/bases").to route_to("team/bases#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/team/bases/1").to route_to("team/bases#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/team/bases/1").to route_to("team/bases#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/team/bases/1").to route_to("team/bases#destroy", id: "1")
    end

  end
end
