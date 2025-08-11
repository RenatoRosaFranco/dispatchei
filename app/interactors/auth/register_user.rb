# frozen_string_literal: true

module Auth
  class RegisterUser
    include Interactor

    delegate :params, to: :context

    def call
      user = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        role: params[:role] || :customer
      )

      unless user.save
        context.fail!(errors: user.errors.full_messages)
      end

      context.user = user
    end
  end
end
