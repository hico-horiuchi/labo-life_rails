class UsersController < ApplicationController
  before_action :load_user
  before_action :authenticate_user!
  before_action :admin_user!, except: [:home, :index, :show, :edit, :update]

  def home
    seminors = Seminor.all
    @undecide_seminors = []
    @undecide_events = []
    seminors.each do |seminor|
      if seminor.attends.user_is(current_user.id).first.nil?
        @undecide_seminors << seminor if seminor.chairman_user_id !=  0
        @undecide_events << seminor if seminor.chairman_user_id ==  0
      end
    end
  end

  def index
    @users = User.all.order(grade: :desc)
  end

  def show
  end

  def new
    render :show_modal_form
  end

  def create
    @user = User.new(user_params)
    @result = @user.save
    @user = nil unless @result
    flash[:notice] = '登録しました。' if @result
  end

  def edit
    redirect_to home_user_path if !current_user.admin? && params[:id].to_i != current_user.id
    render :show_modal_form
  end

  def update
    redirect_to home_user_path if !current_user.admin? && params[:id].to_i != current_user.id
    @result = @user.update(user_params)
    @user = nil unless @result
    flash[:notice] = '更新しました。' if @result
  end

  def activate
    @user.state = State::ACTIVE
    @result = @user.save
    @user = nil unless @result
    flash[:notice] = '復帰しました。' if @result
    flash[:alert] = '復帰できませんでした。' unless @result
    render :reload
  end

  def deactivate
    @user.state = State::INACTIVE
    @result = @user.save
    @user = nil unless @result
    flash[:notice] = '無効化しました。' if @result
    flash[:alert] = '無効化できませんでした。' unless @result
    render :reload
  end

  def destroy
    @result = @user.attends.destroy_all
    @result = @user.destroy if @result
    @user = nil unless @result
    flash[:notice] = '削除しました。' if @result
    flash[:alert] = '削除できませんでした。' unless @result
    render :reload
  end

  private

  def load_user
    @user = User.id_is(params[:id]) if params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :name, :student_no, :password, :password_confirmation, :state, :grade)
  end
end
