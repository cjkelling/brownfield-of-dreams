class UsersController < ApplicationController
  def show
    @facade = UserDashboardFacade.new(current_user)
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Email already exists'
      redirect_to new_user_path
    end
  end

  def update
    user = User.find(current_user.id)
    user.update(token: token_params)
    flash[:success] = 'GitHub account has been connected.' if user.save
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

  def token_params
    request.env['omniauth.auth']['credentials']['token']
  end
end
