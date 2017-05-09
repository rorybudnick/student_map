# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  street     :string
#  street_2   :string
#  city       :string
#  state      :string
#  zip_code   :string
#  notes      :text
#  latitude   :decimal(10, 6)
#  longitude  :decimal(10, 6)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  has_and_belongs_to_many :students

  validates :name, presence: true, uniqueness: true

  def formatted_student_count
    "#{self.students.count} Students"
  end
end
