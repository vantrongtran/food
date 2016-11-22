class UserMailer < ApplicationMailer

  default from: Settings.mail_from

  def order_mail order
    @order = order
    mail to: Settings.mail_to, subject: t("mail.subject")
  end
end
