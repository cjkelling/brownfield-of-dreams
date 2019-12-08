require 'rails_helper'

RSpec.describe Repository do
  it 'has attributes' do
    repo_params = {
      name: "apartments_1908",
      html_url: "https://github.com/CoopTang/apartments_1908"
    }

    repo = Repository.new(repo_params)

    expect(repo.name).to eq(repo_params[:name])
    expect(repo.url).to eq(repo_params[:html_url])
  end
end