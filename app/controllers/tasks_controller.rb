class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new(task_params)
    @task.board_id = params[:board_id]
    @task.user = current_user
  end

  def create
    @task = Task.new(task_params)
    @task.board_id = params[:board_id]
    
    binding.pry
    
    if @task.save!
      redirect_to tasks_path(@tasks), notice: 'タスクを追加しました'
    else
      flash.now[:error] = 'タスクを追加できませんでした'
      render :new
    end
  end

  def edit
    
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @board.task.find(params[:id]).destroy
    redirect_to tasks_path, notice: '削除しました。'
  end

  private

  def task_params
    params.permit(:task, :title, :content).merge(user_id: current_user.id, board_id: Board.ids)
  end

  def set_task
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
  end
end
