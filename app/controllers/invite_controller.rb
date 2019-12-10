class InviteController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new; end

  def create
    response = GithubService.get_user(ENV['GITHUB_TESTING_TOKEN'], params[:github_handle])
    invitation = EmailInvitation.new(current_user.first_name, response)

    if invitation.email
      InvitationNotifierMailer.inform(invitation).deliver_now
      flash[:notice] = 'Successfully sent invite!'
    else
      flash[:notice] = 'The Github user you selected doesn\'t have an email address associated with their account.'
    end
    redirect_to dashboard_path
  end
end
