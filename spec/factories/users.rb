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
#  grade           :integer          default(0), not null
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bachelor, class: User do
    name 'bachelor'
    student_no 'bachelor'
    email 'bachelor@labolife.jp'
    password 'hogehogehoge'
    password_confirmation 'hogehogehoge'
    grade 3
  end

  factory :master, class: User do
    name 'master'
    student_no 'asistant'
    email 'master@labolife.jp'
    password 'hogehogehoge'
    password_confirmation 'hogehogehoge'
    grade 4
  end

  factory :teacher, class: User do
    name 'teacher'
    student_no 'teacher'
    email 'teacher@labolife.jp'
    password 'hogehogehoge'
    password_confirmation 'hogehogehoge'
    grade 10
  end
end
