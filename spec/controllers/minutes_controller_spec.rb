require 'spec_helper'

describe MinutesController do
  describe '#new' do
    before do
      user = FactoryGirl.create(:master)
      session[:user_id] = user.id
      seminor_params = FactoryGirl.attributes_for(:seminor)
      seminor_params[:chairman_user_id] = user.id
      seminor_params[:created_user_id] = user.id
      seminor = Seminor.create(seminor_params)
      xhr :get, :new, seminor_id: seminor.id
    end
    it { expect(response).to be_success }
  end
end
