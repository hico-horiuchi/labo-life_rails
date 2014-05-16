# == Schema Information
#
# Table name: seminors
#
#  id               :integer          not null, primary key
#  chairman_user_id :integer          not null
#  created_user_id  :integer          not null
#  caption          :string(255)      default(""), not null
#  state            :integer          default(0), not null
#  created_at       :datetime
#  updated_at       :datetime
#  start_at         :datetime         not null
#  end_at           :datetime         not null
#  place            :string(255)      default(""), not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seminor do
    caption 'ゼミナール'
    start_at '2100/01/01 12:00'
    end_at '2100/12/31 12:00'
    place '研究室'
  end

  factory :event, class: Seminor do
    caption 'ケーキ会'
    start_at '2100/01/01 12:00'
    end_at '2100/12/31 12:00'
    place 'ラウンジ'
    chairman_user_id 0
  end
end
