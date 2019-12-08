class GithubUser
  attr_reader :user_name,
              :profile_url

  def initialize(args)
    @user_name   = args[:login]
    @profile_url = args[:html_url]
  end
end