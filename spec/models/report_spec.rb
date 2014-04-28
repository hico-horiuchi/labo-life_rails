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

require 'spec_helper'

describe Report do
end
