# frozen_string_literal: true

class RegisterResponseSerializer < ActiveModel::Serializer
  attributes :token
  has_one :user, serializer: UserSerializer
end
