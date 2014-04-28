# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  attend_id  :integer          default(0), not null
#  caption    :string(255)      default(""), not null
#  abstract   :text             default(""), not null
#  document   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer          default(0), not null
#  seminor_id :integer          default(0), not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
  end
end
