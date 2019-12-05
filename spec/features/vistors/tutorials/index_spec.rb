require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the home page' do
    before :each do
      @tutorial_1 = create(:tutorial)
      @tutorial_2 = create(:tutorial, classroom: true)
      visit '/'
    end
      
    it 'I only see tutorials that are not marked as "classroom content"' do
      expect(page).to have_content(@tutorial_1.title)
      expect(page).to_not have_content(@tutorial_2.title)
    end

    it 'I can click on links to the tutorial show page' do
      video_1 = create(:video, tutorial_id: @tutorial_1.id)

      click_on @tutorial_1.title

      expect(current_path).to eq(tutorial_path(@tutorial_1))
      expect(page).to have_content(video_1.title)
      expect(page).to have_content(@tutorial_1.title)
    end
  end
end