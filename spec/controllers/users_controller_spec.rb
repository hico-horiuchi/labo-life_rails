require 'spec_helper'

describe UsersController do
  describe '#home' do
    before do
      session[:user_id] = FactoryGirl.create(:student).id
      get :home
    end
    it { expect(response).to render_template :home }
    it { expect(response).to be_success }
  end

  describe '#index' do
    before do
      session[:user_id] = FactoryGirl.create(:assistant).id
      get :index
    end
    it { expect(response).to render_template :index }
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
      session[:user_id] = FactoryGirl.create(:assistant).id
      @user_params = FactoryGirl.attributes_for(:student)
      xhr :post, :create, user: @user_params
    end
    it { expect(response).to be_success }
    it { expect(assigns[:user]).to eq(User.last) }
    it { expect(assigns[:result]).to be_true }
  end

  describe '#edit' do
    before do
      @user = FactoryGirl.create(:assistant)
      session[:user_id] = @user.id
      xhr :get, :edit, id: @user.id
    end
    it { expect(response).to be_success }
  end

  describe '#update' do
    before do
      session[:user_id] = FactoryGirl.create(:assistant).id
      @user = FactoryGirl.create(:student)
      @user_params = FactoryGirl.attributes_for(:student)
      xhr :patch, :update, id: @user.id, user: @user_params
    end
    it { expect(response).to be_success }
    it { expect(assigns[:result]).to be_true }
  end
end
