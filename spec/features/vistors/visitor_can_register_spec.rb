require 'rails_helper'

describe 'vister can create an account', :js do
  it ' visits the home page' do
    # create(:user, email: 'email@example.com')
    email = 'email@example.com'
    first_name = 'Jim'
    last_name = 'Bob'
    password = 'password'
    password_confirmation = 'password'

    visit '/'

    click_on 'Sign In'

    expect(current_path).to eq(login_path)

    click_on 'Sign up now.'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on'Create Account'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(email)
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to have_content('Inactive')
    expect(page).to have_content('A confirmation email was sent to the email you registered with. Please check your email!')
    expect(page).to_not have_content('Sign In')
  end

  it 'visitors cannot create and account if email is already taken', :js do
    create(:user, email: 'email@example.com')

    email = 'email@example.com'
    first_name = 'Jim'
    last_name = 'Bob'
    password = 'password'
    password_confirmation = 'password'

    visit new_user_path

    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on'Create Account'

    expect(page).to have_content('Email already exists')
  end
end
