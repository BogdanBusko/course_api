class ActivationMailer < ApplicationMailer
  default from: "busko.bogdan@gmail.com"

  def activation(user)
    @user = user
    mail(
      to: @user.email, 
      subject: 'Підтвердження'
    )
  end
end
