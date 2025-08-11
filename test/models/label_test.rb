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

require "test_helper"

class LabelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
