require 'rails_helper'

describe 'As a registered user' do
  describe 'when I visit my dashboard' do
    it 'I should see the link "Add as Friend" next to GitHub Followers that are in the system.', :vcr do
      user = create(:user, token: ENV['GITHUB_TESTING_TOKEN'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      create(:user, first_name: 'Christopher', email: 'cj.kelling88@gmail.com')

      visit dashboard_path

      expect(page).to have_content('You are not currently friends with anyone in the system.')

      within '#follower-1' do
        expect(page).to have_link('cjkelling')
        expect(page).to have_button('Add as Friend')
      end

      within '#follower-2' do
        expect(page).to have_link('mcat56')
        expect(page).to_not have_button('Add as Friend')
      end

      within '#follower-1' do
        click_button 'Add as Friend'
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Christopher has been added to your friends list!')
      expect(page).to have_content('You currently have 1 friends:')

      within '.friends' do
        expect(page).to have_content('Christopher')
      end
    end
  end
end
