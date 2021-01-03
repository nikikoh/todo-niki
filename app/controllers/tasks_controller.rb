class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update]

  def index
    @tasks = Task.all
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
    @task.user = current_user
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to board_tasks_path(board), notice: 'タスクを追加しました'
    else
      flash.now[:error] = 'タスクを追加できませんでした'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to tasks_path, notice: '削除しました。'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
