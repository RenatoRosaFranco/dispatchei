# == Schema Information
#
# Table name: pickup_snapshots
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

FactoryBot.define do
  factory :pickup_snapshot do
    name { "MyString" }
    phone { "MyString" }
    address_line { "MyString" }
    complement { "MyString" }
    neighborhood { "MyString" }
    city { "MyString" }
    state { "MyString" }
    postal_code { "MyString" }
    country { "MyString" }
    lat { "9.99" }
    lng { "9.99" }
    place_id { "MyString" }
    notes { "MyText" }
  end
end
