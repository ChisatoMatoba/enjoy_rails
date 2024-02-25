class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path, notice: '投稿が成功しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find_by(params[:id])
  end

  def update
    @task = Task.find_by(params[:id])

    if @task.update(task_params)
      redirect_to root_path, notice: '編集が成功しました。'
    else
      Rails.logger.debug @facility.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:task, :task_description)
  end
end
