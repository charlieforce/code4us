Devise.setup do |config|

  config.mailer_sender = 'Leo @ Code4Pro <no-reply@code4pro.com>'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  require 'omniauth-google-oauth2'
  config.omniauth :google_oauth2, '571229915673-nonknrpbkt6a710i4s03ibkid82c5fj2.apps.googleusercontent.com', 'ajwhIO031e-aqNNwVUKZJI9r', {access_type: "offline", approval_prompt: ""}

  require 'omniauth-facebook'
  config.omniauth :facebook, "1836033736632603","5fcd78f99d6548a6a4c428410e6847e7", scope: 'email', info_fields: 'email,name'

  require 'omniauth-github'
  config.omniauth :github, '7616272cd459d3539d91', '017d1ea7e87878ba19a1a0c20dbaac61e6499ca9', scope: "user:email"
end
