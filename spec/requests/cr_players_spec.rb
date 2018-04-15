require 'rails_helper'

RSpec.describe "CrPlayers", type: :request do
  describe "GET /cr_players" do
    it "works! (now write some real specs)" do
      get cr_players_path
      expect(response).to have_http_status(200)
    end
  end
end
