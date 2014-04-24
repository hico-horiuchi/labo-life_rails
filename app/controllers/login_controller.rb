class LoginController < ApplicationController
  def login
    user = User.where(email: params[:user][:email]).first
    if user
      if !user.active?
        flash[:alert] = 'アカウントが無効化されています。'
        render :new
      elsif user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        flash[:notice] = 'ログインしました。'
        redirect_to home_user_path
      else
        flash[:alert] = 'パスワードが間違っています。'
        render :new
      end
    else
      flash[:alert] = 'メールアドレスが間違っています。'
      render :new
    end
  end

  def new
    session[:user_id] = nil
    @current_user = nil
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    flash[:notice] = 'ログアウトしました。'
    redirect_to root_path
  end
end
