require 'spec_helper'

# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors
feature 'playing the RPS game' do
    before do
        visit '/'
        fill_in 'name', with: 'JP'
        click_button 'Submit'
    end
    
    scenario 'see options' do
        expect(page).to have_button 'Rock'
        expect(page).to have_button 'Paper'
        expect(page).to have_button 'Scissors'
    end

    scenario 'select an option' do
        click_button 'Scissors'
        expect(page).to have_content('You chose Scissors')
    end
end