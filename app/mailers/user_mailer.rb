class UserMailer < ApplicationMailer
  # def welcome_email
  #   @user = params[:user]
  #   @url  = 'http://example.com/login'
  #   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  # end

  def welcome_email(email)
    # @user = params[:user]
    # @url  = user_url(@user)
     delivery_options = { user_name: 'baby book',
                         password: 'perico132435',
                         address: 'lperico127@gmail.com' }
    mail(to: email,
         subject: "Please see the Terms and Conditions attached",
         delivery_method_options: delivery_options)
  end
end
