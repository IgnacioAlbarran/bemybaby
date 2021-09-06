class UserMailer < ApplicationMailer
  # def welcome_email
  #   @user = params[:user]
  #   @url  = 'http://example.com/login'
  #   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  # end

  def welcome_email(email)
    # @user = params[:user]
    # @url  = user_url(@user)
    delivery_options = { user_name: ENV["GMAIL_USER_NAME"],
                         password: ENV["GMAIL_PASSWORD"],
                         address: "smtp.gmail.com",
                         port: 587,
                         domain: "smtp.gmail.com",
                         authentication: "plain",
                         enable_starttls_auto: true,
                         openssl_verify_mode: "none" }
    mail(to: email,
         subject: "Please see the Terms and Conditions attached",
         delivery_method_options: delivery_options)
  end
end
