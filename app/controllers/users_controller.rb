class UsersController < ApplicationController
  before_action :load_user
  before_action :authenticate_user!
  before_action :assistant_user!, only: [:new, :create, :active, :deactive, :destroy]

  def home
  end

  def index
    @users = User.all.order(:id)
  end

  def new
    render :show_modal_form
  end

  def create
    @user = User.new(user_params)
    @result = @user.save
    @user = nil unless @result
    flash[:notice] = '登録できました。'
  end

  def edit
    redirect_to home_user_path if !current_user.assistant? && params[:id].to_i != current_user.id
    render :show_modal_form
  end

  def update
    redirect_to home_user_path if !current_user.assistant? && params[:id].to_i != current_user.id
    @result = @user.update(user_params)
    @user = nil unless @result
    flash[:notice] = '更新できました。'
  end

  def activate
    @user.state = User::State::ACTIVE
    @user = nil unless @user.save
    render :reload
  end

  def deactivate
    @user.state = User::State::INACTIVE
    @user = nil unless @user.save
    render :reload
  end

  def destroy
    @user = nil unless @user.destroy
    render :reload
  end

  private

  def load_user
    @user = User.id_is(params[:id]).first if params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :name, :student_no, :password, :password_confirmation, :state, :level)
  end
end
