# frozen_string_literal: true

module API
  module V1
    class BaseController < ActionController::API
      include Devise::Controllers::Helpers

      before_action :purge_session
      before_action :authenticate_user!

      private

      def purge_session
        request.session_options[:skip] = true
        session.clear if respond_to?(:session) && session
      end
    end
  end
end
