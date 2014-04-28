class AttendsController < ApplicationController
  before_action :load_attend
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def new
    render :show_modal_form
  end

  def create
    @attend = Attend.new(attend_params)
    @result = @attend.save
    @attend = nil unless @result
    flash[:notice] = '登録しました。' if @result
  end

  def edit
    render :show_modal_form
  end

  def update
    @result = @attend.update(attend_params)
    @attend = nil unless @result
    flash[:notice] = '更新しました。' if @result
  end

  def activate
    @attend.state = Attend::State::ACTIVE
    @result = @attend.save
    @attend = nil unless @result
    flash[:notice] = '復帰しました。' if @result
    flash[:alert] = '復帰できませんでした。' unless @result
    render :reload
  end

  def deactivate
    @attend.state = Attend::State::INACTIVE
    @result = @attend.save
    @attend = nil unless @result
    flash[:notice] = '欠席しました。' if @result
    flash[:alert] = '欠席できませんでした。' unless @result
    render :reload
  end

  def destroy
    @attend.report.destroy unless @attend.report.nil?
    @result = @attend.destroy
    @attend = nil unless @result
    flash[:notice] = '取消しました。' if @result
    flash[:alert] = '取消できませんでした。' unless @result
    render :reload
  end

  private

  def load_attend
    @attend = Attend.id_is(params[:id]).first if params[:id]
  end

  def attend_params
    params.require(:attend).permit(:user_id, :seminor_id, report_attributes: [:_destroy, :id, :user_id, :seminor_id, :caption, :abstract, :document])
  end
end
