class TasksController < ApplicationController
    before_action :set_task, only: [:show, :destroy, :edit, :update]

    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_parameter)
        if @task.save
            flash[:success] = "タスクを登録しました。"
            redirect_to tasks_path
        else
            flash.now[:danger] = "タスクの登録に失敗しました。"
            render 'tasks/new'
        end
    end

    def index
        @tasks = Task.all.order(id: :asc)
    end

    def show 
    end

    def destroy
        if @task.destroy
            flash[:success] = "タスクを削除しました。"
            redirect_to tasks_path 
        else
            flash.now[:danger] = "タスクの削除に失敗しました。"
            render 'tasks/index'
        end
    end

    def edit
    end

    def update
        if @task.update(task_parameter)
            flash[:success] = "タスクを編集しました。"
            redirect_to tasks_path 
        else
            flash.now[:danger] = "タスクの編集に失敗しました。"
            render 'tasks/edit'
        end
    end

    private

    def task_parameter
        params.require(:task).permit(:title, :content)
    end

    def set_task
        @task = Task.find(params[:id])
    end
        
end
