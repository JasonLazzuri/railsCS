require 'rails_helper'

RSpec.describe "cr_players/new", type: :view do
  before(:each) do
    assign(:cr_player, CrPlayer.new())
  end

  it "renders new cr_player form" do
    render

    assert_select "form[action=?][method=?]", cr_players_path, "post" do
    end
  end
end
