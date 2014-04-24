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

require 'spec_helper'

describe Seminor do
end
