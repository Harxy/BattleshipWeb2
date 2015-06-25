require 'spec_helper'

feature "setting up the game environment" do
  scenario "board exist when new game starts" do
    visit '/'
    fill_in('name', with: 'mohamed')
    click_button 'New Game'
    click_button 'Start game'
    expect(page).to have_selector('.board')
    expect(page).to have_content('Please')
  end
end
