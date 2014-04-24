# == Schema Information
#
# Table name: seminors
#
#  id               :integer          not null, primary key
#  date             :datetime         not null
#  chairman_user_id :integer          not null
#  created_user_id  :integer          not null
#  caption          :string(255)
#  state            :integer          default(0), not null
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seminor do
  end
end
