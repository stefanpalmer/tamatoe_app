require 'rails_helper'

feature 'Adding entries' do
  scenario 'can add an entry' do
    visit root_path

    click_link 'New Entry'

    fill_in 'Date', with: '08/16/16'
    fill_in 'Foods', with: 'tomatoes, apples, bread'
    fill_in 'Notes', with: 'try eating less bread'

    click_button 'Create Entry'

    expect(page).to have_content('Entry has been added')
  end
end
