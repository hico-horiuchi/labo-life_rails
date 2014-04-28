require 'spec_helper'

describe ReportsController do
  describe '#show' do
    before do
      user = FactoryGirl.create(:student)
      session[:user_id] = user.id

      seminor_params = FactoryGirl.attributes_for(:seminor)
      seminor_params[:chairman_user_id] = user.id
      seminor_params[:created_user_id] = user.id
      seminor = Seminor.create(seminor_params)

      attend_params = {}
      attend_params[:user_id] = user.id
      attend_params[:seminor_id] = seminor.id
      attend_params[:report_attributes] = FactoryGirl.attributes_for(:report)
      attend = Attend.create(attend_params)

      get :show, id: attend.report.id
    end
    it { expect(response).to render_template :show }
    it { expect(response).to be_success }
  end
end
