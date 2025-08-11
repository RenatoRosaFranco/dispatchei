# frozen_string_literal: true

module API
  module V1
    module Auth
      class RegistrationsController < ActionController::API
        include Devise::Controllers::Helpers

        def create
          result = ::Auth::RegisterUser.call(params: sign_up_params)

          unless result.success?
            return render json: { errors: result.errors }, status: :unprocessable_entity
          end

          user = result.user
          token, _ = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil)

          response.set_header('Authorization', "Bearer #{token}")
          render json: { token: token, user: serialize_user(user) }, status: :created
        end

        private

        def sign_up_params
          params.require(:user).permit(:name, :email, :password, :role)
        end

        def serialize_user(user)
          { id: user.id, name: user.name, email: user.email, role: user.role }
        end
      end
    end
  end
end
