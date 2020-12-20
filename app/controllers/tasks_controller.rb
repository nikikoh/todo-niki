class TasksController < ApplicationController
  def index
    board  = Board.find(params[:id])
    @board = Board.find(params[:id])
    @task  = board.task.find(params[:id])
    @tasks = board.tasks.all
  end

  def show
  end

  def new
    board  = Board.find(params[:id])
    @task  = board.tasks.build
  end

  def create
    board  = Board.find(params[:id])
    @task  = board.tasks.build(task_params)
    if @task.save
      redirect_to board_path(board), notice: 'タスクを追加しました'
    else
      flash.now[:error] = 'タスクを追加できませんでした'
      render :new
    end
  end

  def update
    board = Board.find(params[:id])
    @task = board.task.find(params[:id])
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
    params.require(:task).permit(:title, :content).merge(user_id: current_user.id, board_id: @board)
  end
end
