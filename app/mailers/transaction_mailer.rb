# app/mailers/transaction_mailer.rb
class TransactionMailer &amp;gt; MandrillMailer::TemplateMailer
  default from: 'team@yourcompany.com', from_name: 'Your Company'
 
  def welcome(user)
    mandrill_mail template: 'welcome_email',
      subject: I18n.t('email.welcome.subject'),
      to: {email: user.email, name: user.name},
      vars: {
        'USER_IDENTIFIER' =&amp;gt; user.email,
        'LIST_COMPANY' =&amp;gt; 'Your Company'
      },
      important: true,
      inline_css: true,
      async: true
  end
end