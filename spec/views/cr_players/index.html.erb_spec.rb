require 'rails_helper'

RSpec.describe "cr_players/index", type: :view do
  before(:each) do
    assign(:cr_players, [
      CrPlayer.create!(),
      CrPlayer.create!()
    ])
  end

  it "renders a list of cr_players" do
    render
  end
end
