require 'spec_helper'

describe EventController do
  describe '#show' do
    before do
      user = FactoryGirl.create(:bachelor)
      session[:user_id] = user.id
      event_params = FactoryGirl.attributes_for(:event)
      event_params[:created_user_id] = user.id
      event = Seminor.create(event_params)
      get :show, id: event.id
    end
    it { expect(response).to render_template :show }
    it { expect(response).to be_success }
  end

  describe '#new' do
    before do
      session[:user_id] = FactoryGirl.create(:bachelor).id
      xhr :get, :new
    end
    it { expect(response).to be_success }
  end

  describe '#create' do
    before do
      user = FactoryGirl.create(:bachelor)
      session[:user_id] = user.id
      event_params = FactoryGirl.attributes_for(:event)
      event_params[:created_user_id] = user.id
      xhr :post, :create, seminor: event_params
    end
    it { expect(response).to be_success }
    it { expect(assigns[:event]).to eq(Seminor.last) }
    it { expect(assigns[:result]).to be_true }
  end

  describe '#edit' do
    before do
      user = FactoryGirl.create(:bachelor)
      session[:user_id] = user.id
      event_params = FactoryGirl.attributes_for(:event)
      event_params[:created_user_id] = user.id
      event = Seminor.create(event_params)
      xhr :get, :edit, id: event.id
    end
    it { expect(response).to be_success }
  end

  describe '#update' do
    before do
      user = FactoryGirl.create(:bachelor)
      session[:user_id] = user.id
      event_params = FactoryGirl.attributes_for(:event)
      event_params[:created_user_id] = user.id
      event = Seminor.create(event_params)
      xhr :patch, :update, id: event.id, seminor: event_params
    end
    it { expect(response).to be_success }
    it { expect(assigns[:result]).to be_true }
  end
end
