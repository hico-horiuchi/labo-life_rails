# == Schema Information
#
# Table name: attends
#
#  id            :integer          not null, primary key
#  user_id       :integer          default(0), not null
#  seminor_id    :integer          default(0), not null
#  created_at    :datetime
#  updated_at    :datetime
#  state         :integer          default(0), not null
#  absent_reason :text             default("")
#

require 'spec_helper'

describe Attend do
end
