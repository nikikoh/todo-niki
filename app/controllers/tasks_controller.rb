class TasksController < ApplicationController
  before_action :set_task, only: %i[index new create edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build(task_params)
    @task.user = current_user
  end

  def create
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build(task_params)
    if @task.save
      redirect_to task_path(@task), notice: 'タスクを追加しました'
    else
      flash.now[:error] = 'タスクを追加できませんでした'
      render :new
    end
  end

  def edit
    
  end

  def update
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.task.find(params[:id]).destroy
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
