class TasksController < ApplicationController

    def new
        @task = Task.new
    end
    
    def create
        Task.create(task_parameter)
    end

    def index
        @tasks = Task.all
    end

    def show 
        @task = Task.find(params[:id])
    end

    private

    def task_parameter
        params.require(:task).permit(:title, :content)
    end
end
