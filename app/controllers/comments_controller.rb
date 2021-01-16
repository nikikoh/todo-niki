class CommentsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build
  end

  def create
    task     = Task.find(params[:task_id])
    @comment = task.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to task_path(task), notice: 'コメントしました'
    else
      redirect_to request.referer, notice: 'コメントできませんでした'
    end
  end

  def destroy
    @task    = Task.find(params[:task_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
