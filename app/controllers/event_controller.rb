class EventController < ApplicationController
  before_action :load_event
  before_action :authenticate_user!

  def show
  end

  def attend
    render :show_modal_attend
  end

  def new
    render :show_modal_form
  end

  def create
    @event = Seminor.new(event_params)
    @result = @event.save
    @event = nil unless @result
    flash[:notice] = '登録しました。' if @result
  end

  def edit
    render :show_modal_form
  end

  def update
    @result = @event.update(event_params)
    @event = nil unless @result
    flash[:notice] = '更新しました。' if @result
  end

  def destroy
    @result = @event.attends.destroy_all
    @result = @event.destroy if @result
    @event = nil unless @result
    flash[:notice] = '削除しました。' if @result
    flash[:alert] = '削除できませんでした。' unless @result
    render :reload
  end

  private

  def load_event
    @event = Seminor.id_is(params[:id]) if params[:id]
  end

  def event_params
    params.require(:seminor).permit(:caption, :start_at, :end_at, :place, :chairman_user_id, :created_user_id)
  end
end
