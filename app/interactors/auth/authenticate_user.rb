# frozen_string_literal: true

module Auth
  class AuthenticateUser
    include Interactor

    delegate :email, :password, to: :context

    def call
      user = User.find_for_database_authentication(email: email)
      unless user&.valid_password?(context.password)
        context.fail!(errors: ['Invalid email or password'])
      end

      context.user = user
    end
  end
end
