# == Schema Information
#
# Table name: students
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  grade        :string
#  availability :string
#  notes        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Student < ActiveRecord::Base
  has_and_belongs_to_many :locations
end
