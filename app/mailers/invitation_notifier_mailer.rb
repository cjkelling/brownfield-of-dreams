class InvitationNotifierMailer < ApplicationMailer
  def inform(invitation)
    @invitee = invitation
    mail(to: invitation.email, subject: "#{invitation.sender_name} is inviting you to join Brownfield of Dreams.")
  end
end
