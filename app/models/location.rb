# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string
#  street     :string
#  street_2   :string
#  city       :string
#  state      :string
#  country    :string
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  has_and_belongs_to_many :students

  def formatted_student_count
    "#{self.students.count} Students"
  end

end
