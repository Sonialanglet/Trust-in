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

def notify_book(user)
  @user = user # Instance variable => available in view

  mail(to:   @user.prestation.user.email, subject: 'Nouveau message dans Trust-in')
end
end
