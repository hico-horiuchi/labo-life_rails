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

class Seminor < ActiveRecord::Base
  validates :date, presence: true
  validates :chairman_user_id, presence: true
  validates :created_user_id, presence: true
  scope :id_is, -> (id) { where(id: id) }

  include State
end
