# frozen_string_literal: true

module API
  module V1
    class ProfilesController < BaseController
      def show
        render json: current_user,
               serializer: UserSerializer,
               scope: nil,
               status: :ok
      end
    end
  end
end
