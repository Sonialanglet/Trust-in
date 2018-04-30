class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  default from: "Trust-in Boulogne@trust-in.fr"

  #

  def welcome(user)
      @user = user  # Instance variable => available in view

      mail(to: @user.email, subject: 'Bienvenue')
      # This will render a view in `app/views/user_mailer`!
    end



 def reset_password_instructions(record, token, opts={})
       @token = token
       @user = record

       mail(to: @user.email, subject: 'reset_password_instructions')
 end

def notify_book(booking)
  @booking = booking # Instance variable => available in view

  mail(to:   @booking.prestation.user.email, subject: 'Nouveau message dans Trust-in')
end

def notify_want_join(group)
  @group = group
  mail(to:   @group.founder.email, subject: 'Nouvelle demande dans Trust-in')
end

def notify_accept_join(group_user)
  @group_user = group_user
  mail(to:   group_user.user.email, subject: 'Votre demande a été acceptée dans Trust-in')
end


end
