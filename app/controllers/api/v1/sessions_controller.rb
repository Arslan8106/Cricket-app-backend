# frozen_string_literal: true
class Api::V1::SessionsController < ApplicationController
  # skip_before_action :authenticate_user!
  # skip_before_action :authenticate_user_using_x_auth_token

  def create
    # user = User.find_for_database_authentication(email: params[:user] && params[:user][:email])
    # if invalid_opt?(user)
    #   respond_with_error "Incorrect OTP", 401
    # else
    #   sign_in(user)
    #   # render json: { auth_token: user.authentication_token, user: user, is_admin: user.super_admin? },
    #           # location: root_path, status: :created
    #   render json: { auth_token: user.authentication_token, user: user },
    #           location: root_path, status: :created
  end

  def destroy
    sign_out(@user)
    reset_session
  end

  # def invalid_opt?(user)
  #   user.blank? || !user.valid_opt?(params[:user][:otp])
  # end
  #
  # def invalid_password?(user)
  #     user.blank? || !user.valid_password?(params[:user][:password])
  # end
end
