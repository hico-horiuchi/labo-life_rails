require 'spec_helper'

describe LoginController do
  describe '#login' do
    before do
      FactoryGirl.create(:student)
      @user_params = FactoryGirl.attributes_for(:student)
      post :login, user: @user_params
    end
    it { expect(response).to redirect_to home_user_path }
    it { expect(response).to be_redirect }
  end

  describe '#new' do
    before do
      get :new
    end
    it { expect(response).to be_success }
  end

  describe '#destroy' do
    before do
      get :destroy
    end
    it { expect(response).to redirect_to root_path }
    it { expect(response).to be_redirect }
  end
end
