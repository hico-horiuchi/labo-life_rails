class SeminorsController < ApplicationController
  before_action :load_seminor
  before_action :authenticate_user!
  before_action :assistant_user!, except: [:index, :show]

  def index
    from = Time.now.at_beginning_of_day
    to = from + 1.year
    @seminors = Seminor.where(start_at: from...to).order(start_at: :asc)
  end

  def show
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
    @seminor.state = Seminor::State::ACTIVE
    @result = @seminor.save
    @seminor = nil unless @result
    flash[:notice] = '有効化しました。' if @result
    flash[:alert] = '有効化できませんでした。' unless @result
    render :reload
  end

  def deactivate
    @seminor.state = Seminor::State::INACTIVE
    @result = @seminor.save
    @seminor = nil unless @result
    flash[:notice] = '無効化しました。' if @result
    flash[:alert] = '無効化できませんでした。' unless @result
    render :reload
  end

  def destroy
    @result = @seminor.destroy
    @seminor = nil unless @result
    flash[:notice] = '削除しました。' if @result
    flash[:alert] = '削除できませんでした。' unless @result
    render :reload
  end

  private

  def load_seminor
    @seminor = Seminor.id_is(params[:id]).first if params[:id]
  end

  def seminor_params
    params.require(:seminor).permit(:caption, :start_at, :end_at, :place, :chairman_user_id, :created_user_id)
  end
end
