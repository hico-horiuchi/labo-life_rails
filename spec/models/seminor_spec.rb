# == Schema Information
#
# Table name: seminors
#
#  id               :integer          not null, primary key
#  chairman_user_id :integer          not null
#  created_user_id  :integer          not null
#  caption          :string(255)      default(""), not null
#  state            :integer          default(0), not null
#  created_at       :datetime
#  updated_at       :datetime
#  start_at         :datetime         not null
#  end_at           :datetime         not null
#  place            :string(255)      default(""), not null
#

require 'spec_helper'

describe Seminor do
  describe 'users' do
    before do
      user = FactoryGirl.create(:master)
      seminor_params = FactoryGirl.attributes_for(:seminor)
      seminor_params[:chairman_user_id] = user.id
      seminor_params[:created_user_id] = user.id
      @seminor = Seminor.create(seminor_params)
    end
    it { expect(@seminor.users(0)).to eq([]) }
  end

  describe 'event?' do
    describe 'be_true' do
      before do
        user = FactoryGirl.create(:bachelor)
        seminor_params = FactoryGirl.attributes_for(:event)
        seminor_params[:created_user_id] = user.id
        @seminor = Seminor.create(seminor_params)
      end
      it { expect(@seminor.event?).to be_true }
    end

    describe 'be_false' do
      before do
        user = FactoryGirl.create(:master)
        seminor_params = FactoryGirl.attributes_for(:seminor)
        seminor_params[:chairman_user_id] = user.id
        seminor_params[:created_user_id] = user.id
        @seminor = Seminor.create(seminor_params)
      end
      it { expect(@seminor.event?).to be_false }
    end
  end
end
