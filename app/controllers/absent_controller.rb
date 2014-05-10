class AbsentController < ApplicationController
  before_action :load_attend
  before_action :authenticate_user!

  def new
    render :show_modal_form
  end

  def create
    @attend = Attend.new(attend_params)
    @result = @attend.save
    @attend = nil unless @result
    flash[:notice] = '欠席しました。' if @result
  end

  def edit
    render :show_modal_form
  end

  def update
    @result = @attend.update(attend_params)
    @seminor = nil unless @result
    flash[:notice] = '更新しました。' if @result
  end

  private

  def load_attend
    @attend = Attend.id_is(params[:id]) if params[:id]
  end

  def attend_params
    params.require(:attend).permit(:user_id, :seminor_id, :state, :absent_reason)
  end
end
