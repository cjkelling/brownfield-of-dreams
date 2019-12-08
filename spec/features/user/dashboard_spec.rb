require 'rails_helper'

RSpec.describe 'As a logged in user,' do
  describe 'when I visit my dashboard' do
    describe 'I should see a section for Github' do
      before :each do
        user = create(:user, token: ENV['GITHUB_TESTING_TOKEN'])
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit dashboard_path
      end

      it 'where I can see a list of 5 repositories with the name of each Repo linking to the repo on Github', :vcr do

        within '#repository-1' do 
          expect(page).to have_link('B2_mid_mod_1908', href: "https://github.com/CoopTang/B2_mid_mod_1908")
        end

        within '#repository-2' do 
          expect(page).to have_link("FCT", href: "https://github.com/CoopTang/FCT")
        end

        within '#repository-3' do 
          expect(page).to have_link("apartments_1908", href: "https://github.com/CoopTang/apartments_1908")
        end

        within '#repository-4' do 
          expect(page).to have_link("apollo_14", href: "https://github.com/CoopTang/apollo_14")
        end

        within '#repository-5' do 
          expect(page).to have_link("battleship", href: "https://github.com/CoopTang/battleship")
        end

        expect(page).to_not have_css('#respository-6')
      end
    end
  end
end