# frozen_string_literal: true

module API
  module V1
    class BaseController < ActionController::API
      include Devise::Controllers::Helpers

      before_action :authenticate_user!
    end
  end
end
