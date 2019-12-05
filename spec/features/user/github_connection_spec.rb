require 'rails_helper'

describe 'As a user' do
  it 'I can connect to my GitHub account' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_link 'Connect to Github'

    user.reload

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('GitHub account has been connected.')
    expect(user.token).to eq('mock_token')
  end
end
