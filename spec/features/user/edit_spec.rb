require 'rails_helper'

RSpec.describe 'As an inactive User' do
  describe 'When I click on the Register link in the email' do
    it 'changes my active status to "Active"' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      expect(user.confirmed).to eq(false)
      
      visit confirm_path(user)
      
      expect(current_path).to eq(confirm_path(user))
      expect(page).to have_content('Thank you for registering! Your account is now active.')
      
      user.reload
      expect(user.confirmed).to eq(true)

      visit dashboard_path
      
      expect(page).to have_content("Active")
    end
  end
end