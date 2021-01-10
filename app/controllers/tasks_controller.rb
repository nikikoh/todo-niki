class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
    @comments = @task.comments
  end

  def new
    @board = Board.find(params[:board_id])
    @task  = @board.tasks.build
    @task.user = current_user
  end

  def create
    @board = Board.find(params[:board_id])
    @task  = @board.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to board_tasks_path(@board), notice: 'タスクを追加しました'
    else
      flash.now[:error] = 'タスクを追加できませんでした'
      render :new
    end
  end

  def edit
    # set_task
  end

  def update
    # set_task
    if @task.update(task_params)
      redirect_to task_path(task), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    # set_task
    @task.destroy
    redirect_to task_path(task), notice: '削除しました。'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def set_task
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
  end
end
