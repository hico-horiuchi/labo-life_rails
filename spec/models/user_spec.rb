# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      default(""), not null
#  name            :string(255)      default(""), not null
#  student_no      :string(255)      default(""), not null
#  password_digest :string(255)
#  state           :integer          default(0), not null
#  grade           :integer          default(0), not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do
  describe 'last_name' do
    before { @user = FactoryGirl.create(:bachelor) }
    it { expect(@user.last_name).to eq(@user.name) }
  end
end
