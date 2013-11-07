require "httparty"

module Piktochart
  class User

    # sign in sample command
    # Piktochart::User.sign_in(email: "john_doe@yahoo.com", password: "loremipsum")

    def self.sign_in(params)
      if params[:email] and params[:password]
        sign_in_url = "#{HOST_NAME}/api/v1/users/sign_in.json"
        response = HTTParty.post(sign_in_url, body: {user: params})
        
        return response
      else
        return "please check your params"
      end
    end

    # sign out sample command
    # Piktochart::User.sign_out(email: "john_doe@yahoo.com")

    def self.sign_out(params)
      if params[:email]
        get_user_url = "#{HOST_NAME}/api/v1/users/get_user.json"
        user = HTTParty.get(get_user_url, body: {user: params})

        unless user['user'].nil?
          response = nil

          return response
        else
          return "please check your email"
        end
      else
        return "please check your params"
      end
    end

    # invitation sample command
    # Piktochart::User.invitation(email: "john_doe@yahoo.com", email_to_invite: "frank@yahoo.com")

    def self.invitation(params)
      if params[:email] and params[:email_to_invite]
        get_user_url = "#{HOST_NAME}/api/v1/users/get_user.json"
        user = HTTParty.get(get_user_url, body: {user: params})

        unless user['user'].nil?
          invitation_url = "#{HOST_NAME}/api/v1/users/invitation.json"
          response = HTTParty.post(invitation_url, body: {invitation: params})
          
          return response
        else
          return "please check your email"
        end
      else
        return "please check your params"
      end
    end
  end
end