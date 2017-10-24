require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe "success", :type => :feature do
    it "returns http success" do
      visit '/'
      fill_in 'playerInput', with: 'LYC2882J'
      click_on 'Submit'
      page.should have_content('Name: Ja50nLa')
    end
  end

end
