FactoryBot.define do
  factory :dropoff_snapshot do
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
