require "rails_helper"

RSpec.describe CrPlayersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cr_players").to route_to("cr_players#index")
    end

    it "routes to #new" do
      expect(:get => "/cr_players/new").to route_to("cr_players#new")
    end

    it "routes to #show" do
      expect(:get => "/cr_players/1").to route_to("cr_players#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cr_players/1/edit").to route_to("cr_players#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cr_players").to route_to("cr_players#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cr_players/1").to route_to("cr_players#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cr_players/1").to route_to("cr_players#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cr_players/1").to route_to("cr_players#destroy", :id => "1")
    end

  end
end
