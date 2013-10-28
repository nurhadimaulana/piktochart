require "httparty"

module Piktochart
  class User
    def self.sign_in(params)
      if params[:email] and params[:password] and params[:sign_in_url]
        # params[:sign_in_url] = "http://lvh.me:3000/api/v1/users/sign_in.json"
        response = HTTParty.post(params[:sign_in_url], body: {user: params})
        puts response
      else
        puts "please check your params"
      end
    end

    def self.sign_out
      puts "Thanks, you are logged out already"
    end

    def self.invitation(params)
      if params[:email] and params[:email_to_invite]
        get_user_url = "http://lvh.me:3000/api/v1/users/get_user.json"
        user = HTTParty.get(get_user_url, body: {user: params})

        unless user['user'].nil?
          invitation_url = "http://lvh.me:3000/api/v1/users/invitation.json"
          invitation = HTTParty.post(invitation_url, body: {email_to_invite: params[:email_to_invite]})

          puts "success"
          puts invitation
        else
          puts "please check your email"
        end
      else
        puts "please check your params"
      end
    end
  end
end