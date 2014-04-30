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

require 'spec_helper'

describe Advice do
end
