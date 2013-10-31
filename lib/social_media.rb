require "koala"
require "twitter"

module SocialMedia
	# here we assume that user has configured the koala facebook setting like app_id and app_secret
	# token permission : publish_stream, read_stream, publish_action, update_status
	class FacebookPiktochart
		def self.posting(params)
			if params[:token] and params[:message]
				# sample_token = "CAACEdEose0cBAIemZBaR9fG6F3BawBmLLkZCdAssRZCPyb2IO12hZBezpacn2sY9ryebS5qfXsppZC0FZAAmR55mWoI9sshtfw24Kh8XY9VVPV4b1piHBxHSnT2miJnkyGk9ci3l6E6lX7ZC2qThWdNQWdf9mP3yWuPs5FsIgSd9MFpTSTehsbhsBcnsMsyaTgZD"
				@graph = Koala::Facebook::API.new(params[:token])
				response = @graph.put_connections("me", "feed", message: params[:message])

				return {id: response["id"], created_time: Time.now}
			else
				return "please check your params"
			end
		end
	end

	# here user need to input the customer_key, customer_secret, oauth_token, oauth_token_secret of twitter
	class TwitterPiktochart
		def self.posting(params)
			if params[:consumer_key] and params[:consumer_secret] and params[:oauth_token] and params[:oauth_token_secret] and params[:message]
				Twitter.configure do |config|
				  # sample config.consumer_key       = 'pU6shJEv9IM0QFjV9KMsWA'
				  # sample config.consumer_secret    = '2zMICScTezNKjd5UdnB40koqMoI8NnZJTYjJyBIm1Y'
				  # sample config.oauth_token        = '2154047504-vIJZ7omvJwq6hgYcfdb1hTwS6cf8CgHxaIvqKiO'
				  # sample config.oauth_token_secret = 'wevRy4FMf3FTvwScVwyqFSaotENMNf9H0Yk8DMUfhNqc2'
				  config.consumer_key       = params[:consumer_key]
				  config.consumer_secret    = params[:consumer_secret]
				  config.oauth_token        = params[:oauth_token]
				  config.oauth_token_secret = params[:oauth_token_secret]
				end

				response = Twitter.update(params[:message])

				return {id: response["id"], created_time: Time.now}
			else
				return "please check your params"
			end			
		end
	end
end