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
#  place            :string(255)      default(""), not null
#

class Seminor < ActiveRecord::Base
  validates :chairman_user_id, presence: true
  validates :created_user_id, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :place, presence: true
  scope :id_is, -> (id) { where(id: id) }

  include State
end
