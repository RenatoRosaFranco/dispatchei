# frozen_string_literal: true

class User < ApplicationRecord
  # Enum
  enum :role, { customer: 0, driver: 1, operator: 2 }

  # Devise
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  def jwt_subject = id.to_s
  def jwt_payload = {}
end
