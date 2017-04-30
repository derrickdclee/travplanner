class InviteMailer < ApplicationMailer
    default from: "cs290finaldl@gmail.com"
    def new_user_invite(invite, link)
        @email = invite.email
        @url = link
        mail(to: @email, subject: "Welcome to Travel Planner!")
    end
    
    def existing_user_invite(invite)
        @email = invite.email
        mail(to: @email, subject: "You've been invited to a new travel plan!")
    end
end
