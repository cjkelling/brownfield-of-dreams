require 'rails_helper'

RSpec.describe UserDashboardFacade do
  before :each do
    user = create(:user, token: ENV['GITHUB_TESTING_TOKEN'])
    @facade = UserDashboardFacade.new(user)
  end

  it '#user_github_repos', :vcr do
    repos = @facade.user_github_repos

    expect(repos.length).to eq(30)

    expect(repos[0].name).to eq("B2_mid_mod_1908")
    expect(repos[0].url).to eq("https://github.com/CoopTang/B2_mid_mod_1908")

    expect(repos[1].name).to eq("FCT")
    expect(repos[1].url).to eq("https://github.com/CoopTang/FCT")

    expect(repos[2].name).to eq("apartments_1908")
    expect(repos[2].url).to eq("https://github.com/CoopTang/apartments_1908")

    expect(repos[3].name).to eq("apollo_14")
    expect(repos[3].url).to eq("https://github.com/CoopTang/apollo_14")

    expect(repos[4].name).to eq("battleship")
    expect(repos[4].url).to eq("https://github.com/CoopTang/battleship")
  end

  it '#connected_to_github?', :vcr do
    user = create(:user)
    facade_2 = UserDashboardFacade.new(user)

    expect(@facade.connected_to_github?).to eq(true)
    expect(facade_2.connected_to_github?).to eq(false)
  end

  it '#user_github_followers', :vcr do
    users = @facade.user_github_followers

    expect(users.length).to eq(2)
    
    expect(users.first.user_name).to eq('cjkelling')
    expect(users.first.profile_url).to eq('https://github.com/cjkelling')

    expect(users.last.user_name).to eq('mcat56')
    expect(users.last.profile_url).to eq('https://github.com/mcat56')
    
  end
end