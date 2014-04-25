class AttendsController < ApplicationController
  before_action :load_attend
  before_action :authenticate_user!

  def create
    @attend = current_user.attends.create(seminor_id: params[:seminor_id])
    @result = @attend.save
    @attend = nil unless @result
    flash[:notice] = '登録できました。' if @result
    flash[:alert] = '登録できませんでした。' unless @result
    render :reload
  end

  def destroy
    @result = @attend.destroy
    @attend = nil unless @result
    flash[:notice] = '取消できました。' if @result
    flash[:alert] = '取消できませんでした。' unless @result
    render :reload
  end

  private

  def load_attend
    @attend = Attend.id_is(params[:id]).first if params[:id]
  end
end
