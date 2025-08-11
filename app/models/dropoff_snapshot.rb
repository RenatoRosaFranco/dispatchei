# == Schema Information
#
# Table name: dropoff_snapshots
#
#  id           :integer          not null, primary key
#  name         :string
#  phone        :string
#  address_line :string
#  complement   :string
#  neighborhood :string
#  city         :string
#  state        :string
#  postal_code  :string
#  country      :string
#  lat          :decimal(, )
#  lng          :decimal(, )
#  place_id     :string
#  notes        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

# frozen_string_literal: true

class DropoffSnapshot < ApplicationRecord
  include AddressSnapshot
end
