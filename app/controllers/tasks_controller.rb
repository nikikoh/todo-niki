class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @board = Board.find(params[:board_id])
    @task = Board.tasks.find(params[:task_id])
  end

  def show
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to board_path(board), notice: 'タスクを追加しました'
    else
      flash.now[:error] = 'タスクを追加できませんでした'
      render :new
    end
  end

  def update
    @task = Board.find(params[:board_id])
    if @task.update(board_params)
      redirect_to root_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to board_tasks_path, notice: '削除しました。'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content).merge(user_id: current_user.id, board_id: Board.id)
  end
end
