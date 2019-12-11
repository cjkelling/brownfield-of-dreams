class UserDashboardFacade
  attr_reader :user_first_name,
              :user_last_name,
              :user_email,
              :user_github_repos,
              :user_github_followers,
              :user_github_following

  def initialize(user)
    @user_first_name       = user.first_name
    @user_last_name        = user.last_name
    @user_email            = user.email
    @user_token            = user.token
    @user_github_repos     = []
    @user_github_followers = []
    @user_github_following = []
    get_github_data if user_token
  end

  def connected_to_github?
    user_token ? true : false
  end

  private

  attr_reader :user_token

  def get_github_data
    get_github_repos
    get_github_followers
    get_github_following
  end

  def get_github_repos
    repos = GithubService.get_repos(user_token)
    repos.each do |repo_data|
      @user_github_repos.push(Repository.new(repo_data))
    end
    @user_github_repos.sort_by!(&:name)
  end

  def get_github_followers
    followers = GithubService.get_followers(user_token)
    followers.each do |follower_data|
      merged_data = GithubService.get_user(user_token, follower_data[:login]).merge(follower_data)
      @user_github_followers.push(GithubUser.new(merged_data))
    end
    @user_github_followers.sort_by!(&:user_name)
  end

  def get_github_following
    following = GithubService.get_following(user_token)
    following.each do |following_data|
      @user_github_following.push(GithubUser.new(following_data))
    end
    @user_github_following.sort_by!(&:user_name)
  end
end
