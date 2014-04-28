class ReportsController < ApplicationController
  before_action :load_report
  before_action :authenticate_user!

  def show
  end

  private

  def load_report
    @report = Report.id_is(params[:id]) if params[:id]
  end
end
