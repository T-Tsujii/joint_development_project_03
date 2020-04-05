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

    def destroy
        Task.find(params[:id]).destroy
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        Task.find(params[:id]).update(task_parameter)
    end

    private

    def task_parameter
        params.require(:task).permit(:title, :content)
    end
end
