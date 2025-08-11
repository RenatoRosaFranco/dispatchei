# frozen_string_literal: true

class Shipment < ApplicationRecord
  include AASM

  # Enums
  enum :service_type, Enums::Shipment.service_types, prefix: true
  enum :status, Enums::Shipment.statuses, prefix: true

  # Associations
  belongs_to :customer, class_name: 'User'
  belongs_to :driver,   class_name: 'User', optional: true

  belongs_to :pickup_snapshot,  inverse_of: :shipment
  belongs_to :dropoff_snapshot, inverse_of: :shipment

  has_many :shipment_events, dependent: :destroy
end
