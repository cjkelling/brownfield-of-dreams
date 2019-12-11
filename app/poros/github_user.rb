class GithubUser
  attr_reader :user_name,
              :profile_url,
              :email

  def initialize(args)
    @user_name   = args[:login]
    @profile_url = args[:html_url]
    @email       = args[:email]
  end

  def in_system?
    User.find_by(email: @email) ? true : false
  end
end
