# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  reputation  :integer          default(0)
#  difficulty  :string
#  views       :integer          default(0)
#  genre       :string
#  instrument  :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  state       :string           default("INACTIVO")
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
