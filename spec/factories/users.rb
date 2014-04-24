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
  factory :student, class: User do
    name 'student'
    student_no 'student'
    email 'student@labolife.jp'
    password 'hogehogehoge'
    password_confirmation 'hogehogehoge'
    level 0
  end

  factory :assistant, class: User do
    name 'assistant'
    student_no 'asistant'
    email 'assistant@labolife.jp'
    password 'hogehogehoge'
    password_confirmation 'hogehogehoge'
    level 1
  end

  factory :teacher, class: User do
    name 'teacher'
    student_no 'teacher'
    email 'teacher@labolife.jp'
    password 'hogehogehoge'
    password_confirmation 'hogehogehoge'
    level 2
  end
end
