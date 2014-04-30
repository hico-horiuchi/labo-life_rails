require 'spec_helper'

describe AdvicesController do
  describe '#new' do
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
      attend_params[:report_attributes] = FactoryGirl.attributes_for(:report)
      attend_params[:report_attributes][:user_id] = user.id
      attend_params[:report_attributes][:seminor_id] = seminor.id
      attend = Attend.create(attend_params)
      xhr :get, :new, report_id: attend.report.id
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
      attend_params[:report_attributes] = FactoryGirl.attributes_for(:report)
      attend_params[:report_attributes][:user_id] = user.id
      attend_params[:report_attributes][:seminor_id] = seminor.id
      attend = Attend.create(attend_params)
      advice_params = {}
      advice_params[:user_id] = user.id
      advice_params[:report_id] = attend.report.id
      advice_params[:content] = 'アドバイス'
      xhr :post, :create, advice: advice_params
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
      attend_params[:report_attributes] = FactoryGirl.attributes_for(:report)
      attend_params[:report_attributes][:user_id] = user.id
      attend_params[:report_attributes][:seminor_id] = seminor.id
      attend = Attend.create(attend_params)
      advice = attend.report.advices.create(content: 'アドバイス')
      xhr :get, :edit, id: advice.id
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
      attend_params[:report_attributes] = FactoryGirl.attributes_for(:report)
      attend_params[:report_attributes][:user_id] = user.id
      attend_params[:report_attributes][:seminor_id] = seminor.id
      attend = Attend.create(attend_params)
      advice = attend.report.advices.create(content: 'アドバイス')
      xhr :patch, :update, id: advice.id, advice: { content: 'アドバイス' }
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
      attend_params = {}
      attend_params[:user_id] = user.id
      attend_params[:seminor_id] = seminor.id
      attend_params[:report_attributes] = FactoryGirl.attributes_for(:report)
      attend_params[:report_attributes][:user_id] = user.id
      attend_params[:report_attributes][:seminor_id] = seminor.id
      attend = Attend.create(attend_params)
      advice = attend.report.advices.create(content: 'アドバイス')
      xhr :delete, :destroy, id: advice.id
    end
    it { expect(response).to be_success }
    it { expect(assigns[:result]).to be_true }
  end
end
