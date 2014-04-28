# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      default(""), not null
#  name            :string(255)      default(""), not null
#  student_no      :string(255)      default(""), not null
#  password_digest :string(255)
#  state           :integer          default(0), not null
#  level           :integer          default(0), not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :student_no, presence: true, uniqueness: true
  scope :id_is, -> (id) { where(id: id).first }

  has_many :attends
  has_many :reports

  include State
  include Level
end
