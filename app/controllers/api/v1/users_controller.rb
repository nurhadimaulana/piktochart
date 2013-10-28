class Api::V1::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def sign_in
    # user_params = {email:"hadi@41studio.com",password:"testing"}
    user = User.where(email: params[:user][:email]).first
    if user
      if user.valid_password?(params[:user][:password])
        token = TokenPhrase.generate("$")
        status = "success"
      else
        token = ""
        status = "invalid, please check your email and password"
      end
    else
      token = ""
      status = "invalid, email not exist"
    end

    respond_to do |format|
      format.json{render json: {token: token, status: status} }
    end
  end

  def sign_out

  end

  def get_user
    result = User.where(email: params[:user][:email]).first 

    respond_to do |format|
      format.json{render json: {user: result} }
    end
  end

  def invitation
    result = User.invite!(email: :email_to_invite)

    respond_to do |format|
      format.json{render json: {user: result} }
    end
  end
end