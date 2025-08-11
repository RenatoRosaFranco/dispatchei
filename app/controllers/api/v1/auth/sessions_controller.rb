# frozen_string_literal: true

module API
  module V1
    module Auth
      class SessionsController < ActionController::API
        include Devise::Controllers::Helpers

        def create
          result = ::Auth::AuthenticateUser.call(email: params[:email], password: params[:password])

          unless result.success?
            return render json: { error: result.errors }, status: :unauthorized
          end

          user = result.user

          token, _payload = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil)
          response.set_header('Authorization', "Bearer #{token}")


          render json: Wrappers::AuthResponse.new(token:, user:),
                 serializer: LoginResponseSerializer,
                 scope: nil,
                 status: :ok
        end

        def destroy
          render json: { message: 'signed out' }, status: :ok 
        end
      end
    end
  end
end
