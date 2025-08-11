# frozen_string_literal: true

module Wrappers
  class AuthResponse < ActiveModelSerializers::Model
    attributes :token, :user
  end
end
