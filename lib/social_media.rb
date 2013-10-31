require "koala"
require "twitter"

module SocialMedia
  
  # token permission : publish_stream, read_stream, publish_action, update_status
  # invitation via facebook sample command
  # SocialMedia::FacebookPiktochart.posting(token:"i3l6E6lX7ZC2qThWdNQWdf9mP3yWuPs5FsIgSd9MFpTSTehsbhsBcnsMsyaTgZD", message: "Hey, come on join! you will get 50% discount. What are you waiting for ?"”")

  class FacebookPiktochart
    def self.posting(params)
      if params[:token] and params[:message]
        @graph = Koala::Facebook::API.new(params[:token])
        response = @graph.put_connections("me", "feed", message: params[:message])

        return {id: response["id"], created_time: Time.now}
      else
        return "please check your params"
      end
    end
  end

  # here user need to input the customer_key, customer_secret, oauth_token, oauth_token_secret from twitter
  # invitation via twitter sample command
  # SocialMedia::TwitterPiktochart.posting(consumer_key:"pU6shJEv9IM0QFjV9KMsWA", consumer_secret: "2zMICScTezNKjd5UdnB40koqMoI8NnZJTYjJyBIm1Y", oauth_token: "2154047504-vIJZ7omvJwq6hgYcfdb1hTwS6cf8CgHxaIvqKiO", oauth_token_secret: "wevRy4FMf3FTvwScVwyqFSaotENMNf9H0Yk8DMUfhNqc2", message: "Hey, come on join! you will get 50% discount. What are you waiting for ?")

  class TwitterPiktochart
    def self.posting(params)
      if params[:consumer_key] and params[:consumer_secret] and params[:oauth_token] and params[:oauth_token_secret] and params[:message]
        Twitter.configure do |config|
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