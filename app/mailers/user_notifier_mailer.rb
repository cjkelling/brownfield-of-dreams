class UserNotifierMailer < ApplicationMailer

  def confirm(user)
    @user = user
    mail(to: user.email, subject: "One more step to finish registration!")
  end
end
