require 'rails_helper'

RSpec.describe GithubUser do
  it 'has attributes' do
    user_params = {
      login: "username",
      html_url: "https://github.com/CoopTang"
    }

    user = GithubUser.new(user_params)

    expect(user.user_name).to eq(user_params[:login])
    expect(user.profile_url).to eq(user_params[:html_url])
  end
end