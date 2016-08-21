require 'rails_helper'

feature 'User Authentication' do
  scenario 'allows a user to signup' do
    visit root_path

    expect(page).to have_link('Signup')

    click_link 'Signup'

    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Adams'
    fill_in 'Email', with: 'john@adams.com'
    fill_in 'Password', with: 'elephant'
    fill_in 'Password confirmation', with: 'elephant'

    click_button 'Signup'
    expect(page).to have_text('Thank you for signing up John')
    expect(page).to have_text('Signed in as john@adams.com')

  end

  let(:user) {FactoryGirl.create(:user)}
  scenario 'allows existing user to login' do
    user = FactoryGirl.create(:user)

    visit root_path

    expect(page).to have_link('Login')

    click_link('Login')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'

    expect(page).to have_text("Welcome back #{user.first_name.titleize}")

    expect(page).to have_text("Signed in as #{user.email}")

  end

  scenario 'disallows existing user to login with bad password' do
    user = FactoryGirl.create(:user)

    visit root_path

    expect(page).to have_link('Login')

    click_link('Login')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'NOT_YOUR_PASSWORD'

    click_button 'Login'

    expect(page).to have_text('Invalid email or password')

  end

  scenario 'allows logged in user to logout' do
    user = FactoryGirl.create(:user)

    visit root_path

    expect(page).to have_link('Login')

    click_link('Login')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'

    expect(page).to have_text("Welcome back #{user.first_name.titleize}")

    expect(page).to have_text("Signed in as #{user.email}")

    expect(page).to have_link('Logout')

    click_link('Logout')

    expect(page).to have_text("#{user.email} has been logged out")

    expect(page).to_not have_text("Welcome back #{user.first_name.titleize}")

    expect(page).to_not have_text("Signed in as #{user.email}")

  end

end
