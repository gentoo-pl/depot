# -*- encoding : utf-8 -*-
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "bloomnet.eu",
  :user_name            => "tester.herman",
  :password             => "tester31",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
