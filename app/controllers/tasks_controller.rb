class TasksController < ApplicationController

    def new
        @task = Task.new
    end
    
    def create
        Task.create(task_parameter)
    end

    private

    def task_parameter
        params.require(:task).permit(:title, :content)
    end
end
