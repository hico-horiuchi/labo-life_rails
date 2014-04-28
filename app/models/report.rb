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
#

class Report < ActiveRecord::Base
  mount_uploader :document, DocumentUploader
  validates :caption, presence: true
  validates :abstract, presence: true
  scope :id_is, -> (id) { where(id: id) }

  belongs_to :attend

  def document_exist?
    return false if document.path.nil?
    File.exist? document.path
  end
end
