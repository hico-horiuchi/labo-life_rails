require 'spec_helper'

describe CommentsController do
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
      comment_params = {}
      comment_params[:user_id] = user.id
      comment_params[:report_id] = attend.report.id
      comment_params[:content] = 'コメント'
      xhr :post, :create, comment: comment_params
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
      comment = attend.report.comments.create(content: 'コメント')
      xhr :get, :edit, id: comment.id
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
      comment = attend.report.comments.create(content: 'コメント')
      xhr :patch, :update, id: comment.id, comment: { content: 'コメント' }
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
      comment = attend.report.comments.create(content: 'コメント')
      xhr :delete, :destroy, id: comment.id
    end
    it { expect(response).to be_success }
    it { expect(assigns[:result]).to be_true }
  end
end
