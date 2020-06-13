Rails.application.config.middleware.use OmniAuth::Builder do
  provider :netflix, ENV['NETFLIX_KEY'], ENV['NETFLIX_SECRET']
end
