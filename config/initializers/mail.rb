ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp


# config.action_mailer.smtp_settings = {
#   :address              => "smtp.gmail.com",
#   :port                 => 587,
#   :domain               => 'venator.vc',
#   :user_name            => 'renterswallet@venator.vc',
#   :password             => 'venator123',
#   :authentication       => 'plain',
#   :enable_starttls_auto => true,
#   :tls => true
#   }
