# == Schema Information
#
# Table name: boards
#
#  id           :bigint           not null, primary key
#  body         :text(65535)
#  company_name :string(255)
#  person_name  :string(255)
#  work_place   :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
