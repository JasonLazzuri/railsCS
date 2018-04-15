require 'rails_helper'

RSpec.describe "cr_players/show", type: :view do
  before(:each) do
    @cr_player = assign(:cr_player, CrPlayer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
