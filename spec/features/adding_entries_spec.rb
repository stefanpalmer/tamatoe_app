require 'rails_helper'

feature 'Adding entries' do
  scenario 'can add an entry' do
    visit root_path

    click_link 'New Entry'
#save_and_open_page
    select_date(Date.today, from:'entry_date')
    fill_in 'What did you eat today?', with: 'tomatoes, apples, bread'
    fill_in 'Additional Notes', with: 'try eating less bread'

    click_button 'Create Entry'

    expect(page).to have_content('Entry has been added')
  end
end
