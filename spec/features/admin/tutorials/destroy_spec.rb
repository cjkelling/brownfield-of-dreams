require 'rails_helper'

describe 'As an Admin' do
  before :each do
    @video = create(:video)
    @user_video = create(:user_video, video: @video)
    @admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_dashboard_path
  end

  it 'When I delete a tutorial the system deletes related videos.' do
    within ".admin-tutorial-card-#{@video.tutorial.id}" do
      click_button 'Destroy'
    end

    expect(current_path).to eq(admin_dashboard_path)

    expect(page).to have_content("#{@video.tutorial.title} has been deleted.")

    expect(Tutorial.all.length).to eq(0)
    expect(Video.all.length).to eq(0)
  end
end
