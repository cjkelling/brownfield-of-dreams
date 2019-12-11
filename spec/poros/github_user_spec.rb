require 'rails_helper'

RSpec.describe GithubUser do
  it 'has attributes' do
    user_params = {
      login: 'username',
      html_url: 'https://github.com/CoopTang',
      email: 'email@example.com'
    }

    user = GithubUser.new(user_params)

    expect(user.user_name).to eq(user_params[:login])
    expect(user.profile_url).to eq(user_params[:html_url])
    expect(user.email).to eq(user_params[:email])
  end

  it '.in_system?' do
    create(:user, email: 'email@example.com')
    user_params = {
      login: 'username',
      html_url: 'https://github.com/CoopTang',
      email: 'email@example.com'
    }

    user = GithubUser.new(user_params)

    expect(user.in_system?).to eq(true)
  end

  it 'text' do
  end
end
