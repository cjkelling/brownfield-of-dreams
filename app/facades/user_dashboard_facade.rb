class UserDashboardFacade
  attr_reader :user_first_name,
              :user_last_name,
              :user_email,
              :user_github_repos
  
  def initialize(user)
    @user_first_name   = user.first_name
    @user_last_name    = user.last_name
    @user_email        = user.email
    @user_token        = user.token
    @user_github_repos = []
    get_github_repos
  end

  private
  
  attr_reader :user_token

  def get_github_repos
    repos = GithubService.get_repos(user_token)
    repos.each do |repo|
      @user_github_repos.push(
        { repo[:name] => repo[:html_url] }
      )
    end
  end
end