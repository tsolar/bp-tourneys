require 'rails_helper'

RSpec.describe "Tournament::Bases", type: :request do
  describe "GET /tournament_bases" do
    it "works! (now write some real specs)" do
      get tournaments_path
      expect(response).to have_http_status(200)
    end
  end
end
