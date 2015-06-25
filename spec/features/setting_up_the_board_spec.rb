require 'spec_helper'

feature "setting up the game environment" do
    before(:each) do
      $game = Game.new Player, Board
    end
  scenario "board exist when new game starts" do
    visit '/startgame'
    expect(page).to have_selector('.board')
    expect(page).to have_content('Please')
    end
  scenario "place a ship and send it to the board" do

    visit '/startgame'
    select 'Submarine', from: 'ship_type'
    fill_in('coords', with: 'B1')
    choose 'vertical'
    click_button 'Place ship'
    expect(page).to have_content('S')

  end

end
