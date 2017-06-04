module SocialTool
  def self.twitter_search terms
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch('TWITTER_API_KEY')
      config.consumer_secret     = ENV.fetch('TWITTER_SECRET_KEY')
      config.access_token        = ENV.fetch('TWITTER_ACCESS_TOKEN')
      config.access_token_secret = ENV.fetch('TWITTER_SECRET_TOKEN')
    end

    puts "twitter - #{ENV['TWITTER_API_KEY']}"

    client.search(terms, result_type: 'recent').take(6).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end