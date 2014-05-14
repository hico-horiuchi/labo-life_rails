class SeminorsController < ApplicationController
  before_action :load_seminor
  before_action :authenticate_user!
  before_action :admin_user!, except: [:index, :show, :attend]

  def index
    @seminors = Seminor.all
  end

  def show
  end

  def attend
    render :show_modal_attend
  end

  def new
    render :show_modal_form
  end

  def create
    @seminor = Seminor.new(seminor_params)
    @result = @seminor.save
    @seminor = nil unless @result
    flash[:notice] = '登録しました。' if @result
  end

  def edit
    render :show_modal_form
  end

  def update
    @result = @seminor.update(seminor_params)
    @seminor = nil unless @result
    flash[:notice] = '更新しました。' if @result
  end

  def activate
    @seminor.state = State::ACTIVE
    @result = @seminor.save
    @seminor = nil unless @result
    flash[:notice] = '復帰しました。' if @result
    flash[:alert] = '復帰できませんでした。' unless @result
    render :reload
  end

  def deactivate
    @seminor.state = State::INACTIVE
    @result = @seminor.save
    @seminor = nil unless @result
    flash[:notice] = '無効化しました。' if @result
    flash[:alert] = '無効化できませんでした。' unless @result
    render :reload
  end

  def destroy
    @result = @seminor.attends.destroy_all
    @result = @seminor.destroy if @result
    @seminor = nil unless @result
    flash[:notice] = '削除しました。' if @result
    flash[:alert] = '削除できませんでした。' unless @result
    render :reload
  end

  private

  def load_seminor
    @seminor = Seminor.id_is(params[:id]) if params[:id]
  end

  def seminor_params
    params.require(:seminor).permit(:caption, :start_at, :end_at, :place, :chairman_user_id, :created_user_id)
  end
end
