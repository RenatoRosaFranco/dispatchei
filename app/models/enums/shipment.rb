# frozen_string_literal: true

module Enums
  module Shipment
    def self.statuses
      {
        created: 0, assigned: 1, picked_up: 2, in_transit: 3, 
        delivered: 4, exception: 5, canceled: 6
      }.freeze
    end

    def self.service_types
      { urban: 0, intercity: 1 }.freeze
    end 
  end
end
