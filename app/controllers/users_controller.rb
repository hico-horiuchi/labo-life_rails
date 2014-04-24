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
    @user = nil unless @user.save
    flash[:notice] = '登録できました。'
  end

  def edit
    render :show_modal_form
  end

  def update
    @user = nil unless @user.update(user_params)
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
