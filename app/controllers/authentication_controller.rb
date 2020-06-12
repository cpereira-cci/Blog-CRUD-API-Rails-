class AuthenticationController < ApplicationController
    skip_before_action :authorize_request, only: :authenticate

    def authenticate
        command = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
        
        if command.success?
            render json: {auth_token: command.result} , status: 200
        else
            render json: {error: auth_token.errors}, status: :unauthorized
        end
    end

    private

    def auth_params
        params.permit(:email, :password)
    end
end
