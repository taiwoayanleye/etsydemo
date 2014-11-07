class UserMailer < MandrillMailer::TemplateMailer
  default from: "onlyyouandty@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email(user)
    mandrill_mail template: 'welcome_letter',
      subject: "You Talked About Fight Club...",
      from_name: "Tyler Durden",
      to: {email: user.email, name: user.name},
      vars: {
            'USER_NAME' => user.name
    },
      important: true,
      inline_css: true,
      async: true,
      track_clicks: true
  end
end