require 'spec_helper'

describe SeminorsController do
  describe '#index' do
    before do
      session[:user_id] = FactoryGirl.create(:student).id
      get :index
    end
    it { expect(response).to render_template :index }
    it { expect(response).to be_success }
  end

  describe '#edit' do
    before do
      user = FactoryGirl.create(:student)
      session[:user_id] = user.id
      seminor_params = FactoryGirl.attributes_for(:seminor)
      seminor_params[:chairman_user_id] = user.id
      seminor_params[:created_user_id] = user.id
      seminor = Seminor.create(seminor_params)
      get :show, id: seminor.id
    end
    it { expect(response).to render_template :show }
    it { expect(response).to be_success }
  end

  describe '#new' do
    before do
      session[:user_id] = FactoryGirl.create(:assistant).id
      xhr :get, :new
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
      xhr :post, :create, seminor: seminor_params
    end
    it { expect(response).to be_success }
    it { expect(assigns[:seminor]).to eq(Seminor.last) }
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
      xhr :get, :edit, id: seminor.id
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
      xhr :patch, :update, id: seminor.id, seminor: seminor_params
    end
    it { expect(response).to be_success }
    it { expect(assigns[:result]).to be_true }
  end
end