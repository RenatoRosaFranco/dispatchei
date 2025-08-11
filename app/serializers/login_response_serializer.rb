# frozen_string_literal: true

class LoginResponseSerializer < ActiveModel::Serializer
  attributes :token
  has_one :user, serializer: UserSerializer
end
