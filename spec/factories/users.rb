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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  end
end
