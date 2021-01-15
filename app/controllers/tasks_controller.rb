class TasksController < ApplicationController
  before_action :set_task, only: %i[show]

  def index
    @tasks = Task.all.order
  end

  def show
    # set_task
    @comments = @task.comments
  end

  def new
    @board = Board.find(params[:board_id])
    @task  = @board.tasks.build
    @task.user = current_user
  end

  def create
    board = Board.find(params[:board_id])
            @task  = board.tasks.build(task_params)
            @task.user = current_user
    if @task.save
      redirect_to board_path(board), notice: '追加しました'
    else
      flash.now[:error] = '追加できませんでした'
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    task = current_user.tasks.find(params[:id])
    if task.update(task_params)
      redirect_to task_path(task), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    task =  current_user.tasks.find(params[:id])
            board = task.board
    task.destroy!
    redirect_to board_path(board), notice: '削除しました。'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def set_task
    @task  = Task.find(params[:id])
  end
end
