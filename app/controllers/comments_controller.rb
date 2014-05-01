class CommentsController < ApplicationController
  before_action :load_comment
  before_action :authenticate_user!

  def new
    render :show_modal_form
  end

  def create
    @comment = Comment.new(comment_params)
    @result = @comment.save
    @comment = nil unless @result
    flash[:notice] = '登録しました。' if @result
  end

  def edit
    render :show_modal_form
  end

  def update
    @result = @comment.update(comment_params)
    @comment = nil unless @result
    flash[:notice] = '更新しました。' if @result
  end

  def destroy
    @result = @comment.destroy
    @comment = nil unless @result
    flash[:notice] = '削除しました。' if @result
    flash[:alert] = '削除できませんでした。' unless @result
    render :reload
  end

  private

  def load_comment
    @comment = Comment.id_is(params[:id]) if params[:id]
  end

  def comment_params
    params.require(:comment).permit(:user_id, :report_id, :content)
  end
end
