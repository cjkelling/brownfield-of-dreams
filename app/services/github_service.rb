class GithubService
  URL = 'https://api.github.com/'.freeze
  USER_PATH = 'user'.freeze
  USER_REPOS_PATH = 'user/repos'.freeze
  USER_FOLLOWERS_PATH = 'user/followers'.freeze
  USER_FOLLOWING_PATH = 'user/following'.freeze

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

  def self.get_user(user_token, user_handle)
    response = ApiQuerier.query_api(
      URL,
      "users/#{user_handle}",
      user_token
    )
  end
end
