Rails.application.config.middleware.use OmniAuth::Builder do
  provider :netflix, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end
