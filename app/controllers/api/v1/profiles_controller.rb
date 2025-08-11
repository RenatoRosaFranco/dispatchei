# frozen_string_literal: true

module API
  module V1
    class ProfilesController < BaseController
      def show
        render json: {
          id: current_user.id,
          name: current_user.name,
          email: current_user.email,
          role: current_user.role
        }, status: :ok
      end
    end
  end
end
