Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
    # :scope => 'email,public_profile,user_friends', :display => 'popup'
end