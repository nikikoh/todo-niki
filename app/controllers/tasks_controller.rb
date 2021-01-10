class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]

  def index
    @board = Board.find(params[:board_id])
  end

  def show
    @tasks = Task.all.order(created_at: :desc)
    @task = Task.find(params[:id])
    @board = Board.find(params[:board_id])
    @comment = Comment.new
    @comment = @task.comments
  end

  def new
    @task = Task.new
    @board = Board.find(params[:board_id])
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
      redirect_to board_tasks_path(@board), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    # set_task
    @board = Board.find(params[:board_id])
    @task.destroy
    redirect_to board_tasks_path(@board), notice: '削除しました。'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def set_task
    @board = Board.find(params[:board_id])
    @task  = current_user.tasks.find(params[:id])
  end
end
