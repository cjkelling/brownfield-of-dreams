require 'rails_helper'

RSpec.describe 'ApiQuerier' do
  it 'can query an API', :vcr do
    response = ApiQuerier.query_api(
      'https://api.github.com', 
      '',
      'fa51402df13a16ce5b994404c1b7ce981d34316d'
    )
    expect(response[:current_user_url]).to eq("https://api.github.com/user")
  end
end