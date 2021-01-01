class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update]

  def index
    @board = Board.find(params[:board_id])
    @tasks = Task.all
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    @task.user_id = current_user.id
    if @task.save!
      redirect_to tasks_path(@tasks), notice: 'タスクを追加しました'
    else
      flash.now[:error] = 'タスクを追加できませんでした'
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  def destroy
    board = Board.find(params[:board_id])
    board.task.find(params[:id]).destroy
    redirect_to tasks_path, notice: '削除しました。'
  end

  private

  def task_params
    puts'---------------------'
    puts params
    puts'---------------------'
    params.require(:task).permit(:title, :content).merge(user_id: current_user.id, board_id: params[:board])
  end

  def set_task
    @board = Board.find(params[:task][:board_id])
    @task = @board.tasks.find(params[:id])
  end
end
