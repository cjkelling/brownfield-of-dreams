require 'rails_helper'

describe 'When a visitor visits a video show page' do
  describe 'They cannot view the bookmark button without being logged in.' do
    it 'They are shown an error message and asked to log in or register' do
      tutorial = create(:tutorial)
      create(:video, tutorial_id: tutorial.id)

      visit tutorial_path(tutorial)

      expect(page).to have_content('Please Register or Sign In to Bookmark video.')

      within '.bookmarks-btn' do
        click_link 'Register'
      end

      expect(current_path).to eq(register_path)

      visit tutorial_path(tutorial)

      within '.bookmarks-btn' do
        click_link 'Sign In'
      end

      expect(current_path).to eq(login_path)
    end
  end
end
