require 'rails_helper'

RSpec.describe "cr_players/edit", type: :view do
  before(:each) do
    @cr_player = assign(:cr_player, CrPlayer.create!())
  end

  it "renders the edit cr_player form" do
    render

    assert_select "form[action=?][method=?]", cr_player_path(@cr_player), "post" do
    end
  end
end
