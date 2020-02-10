class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to:user.email,subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  
  # トークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
    
  end
end
