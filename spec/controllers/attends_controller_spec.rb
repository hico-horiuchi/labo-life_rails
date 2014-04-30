require 'spec_helper'

describe AttendsController do
  describe '#new' do
    before do
      user = FactoryGirl.create(:assistant)
      session[:user_id] = user.id
      seminor_params = FactoryGirl.attributes_for(:seminor)
      seminor_params[:chairman_user_id] = user.id
      seminor_params[:created_user_id] = user.id
      seminor = Seminor.create(seminor_params)
      xhr :get, :new, seminor_id: seminor.id
    end
    it { expect(response).to be_success }
  end

  describe '#create' do
    before do
      user = FactoryGirl.create(:assistant)
      session[:user_id] = user.id
      seminor_params = FactoryGirl.attributes_for(:seminor)
      seminor_params[:chairman_user_id] = user.id
      seminor_params[:created_user_id] = user.id
      seminor = Seminor.create(seminor_params)
      attend_params = {}
      attend_params[:user_id] = user.id
      attend_params[:seminor_id] = seminor.id
      xhr :post, :create, attend: attend_params
    end
    it { expect(response).to be_success }
    it { expect(assigns[:result]).to be_true }
  end

  describe '#edit' do
    before do
      user = FactoryGirl.create(:assistant)
      session[:user_id] = user.id
      seminor_params = FactoryGirl.attributes_for(:seminor)
      seminor_params[:chairman_user_id] = user.id
      seminor_params[:created_user_id] = user.id
      seminor = Seminor.create(seminor_params)
      attend_params = {}
      attend_params[:user_id] = user.id
      attend_params[:seminor_id] = seminor.id
      attend = Attend.create(attend_params)
      xhr :get, :edit, id: attend.id
    end
    it { expect(response).to be_success }
  end

  describe '#update' do
    before do
      user = FactoryGirl.create(:assistant)
      session[:user_id] = user.id
      seminor_params = FactoryGirl.attributes_for(:seminor)
      seminor_params[:chairman_user_id] = user.id
      seminor_params[:created_user_id] = user.id
      seminor = Seminor.create(seminor_params)
      attend_params = {}
      attend_params[:user_id] = user.id
      attend_params[:seminor_id] = seminor.id
      attend = Attend.create(attend_params)
      xhr :patch, :update, id: attend.id, attend: attend_params
    end
    it { expect(response).to be_success }
    it { expect(assigns[:result]).to be_true }
  end

  describe '#destroy' do
    before do
      user = FactoryGirl.create(:assistant)
      session[:user_id] = user.id
      seminor_params = FactoryGirl.attributes_for(:seminor)
      seminor_params[:chairman_user_id] = user.id
      seminor_params[:created_user_id] = user.id
      seminor = Seminor.create(seminor_params)
      attend = Attend.create(user_id: user.id, seminor_id: seminor.id)
      xhr :delete, :destroy, id: attend.id
    end
    it { expect(response).to be_success }
    it { expect(assigns[:result]).to be_true }
  end
end
