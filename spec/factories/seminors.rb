# == Schema Information
#
# Table name: seminors
#
#  id               :integer          not null, primary key
#  chairman_user_id :integer          not null
#  created_user_id  :integer          not null
#  caption          :string(255)
#  state            :integer          default(0), not null
#  created_at       :datetime
#  updated_at       :datetime
#  start_at         :datetime         not null
#  end_at           :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seminor do
  end
end
