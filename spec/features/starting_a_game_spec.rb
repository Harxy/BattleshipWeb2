require 'spec_helper'

feature 'Starting a new game' do
  scenario 'Ask the user for their name' do
    visit '/'
    fill_in('name', with: 'mohamed')
    click_button 'New Game'
    expect(page).to have_content "Hello, mohamed"
  end
  scenario 'Ask the user to click a button to start the game and place a ship' do
    visit '/newgame'
    click_button 'Start game'
    expect(page).to have_content "Please enter a coordinate to place your ship:"
  end
end
