# == Schema Information
#
# Table name: labels
#
#  id             :integer          not null, primary key
#  shipment_id    :integer          not null
#  qrcode_payload :text
#  pdf_url        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_labels_on_shipment_id  (shipment_id)
#

FactoryBot.define do
  factory :label do
    shipment { nil }
    qrcode_payload { "MyText" }
    pdf_url { "MyString" }
  end
end
