# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             default(""), not null
#  user_id    :integer          default(0), not null
#  report_id  :integer          default(0), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Comment do
end
