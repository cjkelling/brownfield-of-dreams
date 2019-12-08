require 'rails_helper'

RSpec.describe 'GithubService' do
  before :each do
    @user_token = ENV['GITHUB_TESTING_TOKEN']
  end

  it 'can get all repos for a user', :vcr do
    response = GithubService.get_repos(@user_token)
    
    expect(response.length).to eq(30)
    
    expect(response.first[:name]).to eq("brownfield-of-dreams")
    expect(response.first[:full_name]).to eq("cjkelling/brownfield-of-dreams")
    expect(response.first[:fork]).to eq(true)
  end
  
  it 'can get all followers for a user', :vcr do
    response = GithubService.get_followers(@user_token)

    expect(response.length).to eq(2)
    
    expect(response.first[:login]).to eq('mcat56')
    expect(response.last[:login]).to eq('cjkelling')
  end
  
  it 'can get all users a user is following', :vcr do
    response = GithubService.get_following(@user_token)
    
    expect(response.length).to eq(1)
    expect(response.first[:login]).to eq('cjkelling')
  end
end