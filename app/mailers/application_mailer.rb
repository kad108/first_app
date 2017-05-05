class ApplicationMailer < ActionMailer::Base
  default from: 'message@myapp.com'
  layout 'mailer'
end
