# == Schema Information
#
# Table name: attends
#
#  id         :integer          not null, primary key
#  user_id    :integer          default(0), not null
#  seminor_id :integer          default(0), not null
#  created_at :datetime
#  updated_at :datetime
#  state      :integer          default(0), not null
#

class Attend < ActiveRecord::Base
  validates :user_id, presence: true
  validates :seminor_id, presence: true
  scope :id_is, -> (id) { where(id: id) }

  belongs_to :user
  belongs_to :seminor
  has_one :report
  accepts_nested_attributes_for :report, allow_destroy: true

  include State
end
