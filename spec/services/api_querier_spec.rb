require 'rails_helper'

RSpec.describe 'ApiQuerier' do
  it 'can query an API', :vcr do
    response = ApiQuerier.query_api(
      'https://api.github.com', 
      '',
      ENV['GITHUB_TESTING_TOKEN']
    )
    expect(response[:current_user_url]).to eq("https://api.github.com/user")
  end
end