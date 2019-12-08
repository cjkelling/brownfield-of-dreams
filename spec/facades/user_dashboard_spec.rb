require 'rails_helper'

RSpec.describe UserDashboardFacade do
  before :each do
    user = create(:user, token: ENV['GITHUB_TESTING_TOKEN'])
    @facade = UserDashboardFacade.new(user)
  end

  it '#user_github_repos', :vcr do
    @facade.user_github_repos

    repos = @facade.user_github_repos

    expect(repos.length).to eq(30)

    sample_repos = [
      { "brownfield-of-dreams" => "https://github.com/cjkelling/brownfield-of-dreams" },
      { "apartments_1908"      => "https://github.com/CoopTang/apartments_1908" },
      { "apollo_14"            => "https://github.com/CoopTang/apollo_14" },
      { "B2_mid_mod_1908"      => "https://github.com/CoopTang/B2_mid_mod_1908" },
      { "battleship"           => "https://github.com/CoopTang/battleship" }
    ]
    
    sample_repos.each do |repo|
      expect(repos.include?(repo)).to eq(true)
    end
  end
end