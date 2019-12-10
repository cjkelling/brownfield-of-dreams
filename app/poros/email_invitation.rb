class EmailInvitation
  attr_reader :name,
              :email,
              :sender_name

  def initialize(sender_name, invitee_args)
    @sender_name = sender_name
    @name = invitee_args[:name]
    @email = invitee_args[:email]
  end
end
