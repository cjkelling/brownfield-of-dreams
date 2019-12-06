class GithubService
  URL = 'https://api.github.com/'
  USER_PATH = 'user'
  USER_REPOS_PATH = 'user/repos'
  USER_FOLLOWERS_PATH = 'user/followers'
  USER_FOLLOWING_PATH = 'user/following'

  def self.get_repos(user_token)
    response = ApiQuerier.query_api(
      URL,
      USER_REPOS_PATH,
      user_token
    )
  end
  def self.get_followers(user_token)
    response = ApiQuerier.query_api(
      URL,
      USER_FOLLOWERS_PATH,
      user_token
    )
  end
  def self.get_following(user_token)
    response = ApiQuerier.query_api(
      URL,
      USER_FOLLOWING_PATH,
      user_token
    )
  end
end
