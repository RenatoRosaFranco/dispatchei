# frozen_string_literal: true

class Shipment < ApplicationRecord
  include AASM

  SHIPMENT_STATUSES = {
    created: 0,
    assigned: 1,
    picked_up: 2,
    in_transit: 3,
    delivered: 4,
    exception: 5,
    canceled: 6
  }.freeze

  # Enums
  enum :service_type, { urban: 0, intermunicipal: 1 }
  enum :status, SHIPMENT_STATUSES

  # Associations
  belongs_to :customer, class_name: 'User'
  belongs_to :driver,   class_name: 'User', optional: true

  belongs_to :pickup_snapshot,  inverse_of: :shipment
  belongs_to :dropoff_snapshot, inverse_of: :shipment

  has_many :shipment_events, dependent: :destroy
end
