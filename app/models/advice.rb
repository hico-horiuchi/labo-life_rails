# == Schema Information
#
# Table name: advices
#
#  id         :integer          not null, primary key
#  content    :text             default(""), not null
#  user_id    :integer          default(0), not null
#  report_id  :integer          default(0), not null
#  created_at :datetime
#  updated_at :datetime
#

class Advice < ActiveRecord::Base
  validates :user_id, presence: true
  validates :report_id, presence: true
  validates :content, presence: true
  scope :id_is, -> (id) { where(id: id).first }

  belongs_to :user
  belongs_to :report
end
