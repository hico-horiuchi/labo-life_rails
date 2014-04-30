class AdvicesController < ApplicationController
  before_action :load_advice
  before_action :authenticate_user!

  def new
    render :show_modal_form
  end

  def create
    @advice = Advice.new(advice_params)
    @result = @advice.save
    @advice = nil unless @result
    flash[:notice] = '登録しました。' if @result
  end

  def edit
    render :show_modal_form
  end

  def update
    @result = @advice.update(advice_params)
    @advice = nil unless @result
    flash[:notice] = '更新しました。' if @result
  end

  def destroy
    @result = @advice.destroy
    @advice = nil unless @result
    flash[:notice] = '削除しました。' if @result
    flash[:alert] = '削除できませんでした。' unless @result
    render :reload
  end

  private

  def load_advice
    @advice = Advice.id_is(params[:id]) if params[:id]
  end

  def advice_params
    params.require(:advice).permit(:user_id, :report_id, :content)
  end
end
