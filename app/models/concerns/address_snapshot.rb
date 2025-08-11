# frozen_string_literal: true

module AddressSnapshot
  extend ActiveSupport::Concern

  included do
    has_one :shipment, dependent: :restrict_with_exception
    validates :address_line, :city, :state, :country, presence: true
  end
end
