class UserMailer < ApplicationMailer

  def sign_up(user)
    @user = user
    @url = 'https://fakesite.com/login'
    mail(to: @user.email, subject: 'Thank you for signing up to my awesome site!')
  end

end
