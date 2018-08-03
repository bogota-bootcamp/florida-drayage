class ApplicationMailer < ActionMailer::Base
  default from: ENV['Mailer_sender_app']
  layout 'mailer'
end
