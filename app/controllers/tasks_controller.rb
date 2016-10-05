class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def create
    @params = params
    @mytask = Task.new
    @mytask.title = params["task"]["title"]
    @mytask.description = params["task"]["description"]
    @mytask.details = params["task"]["details"]
    @mytask.completion_status = params["task"]["completion_status"]
    @mytask.completion_date = params["task"]["completion_date"]
    @mytask.save
  end


  def new
    @mytask = Task.new
  end

  def show
    @mytask = Task.find(params[:id].to_i)
  end

  def destroy
    @mytask = Task.find(params[:id].to_i)
    @mytask.destroy
    @destroy_msg = "Task Successfully Deleted"
  end

  def edit
      @mytask = Task.find(params[:id].to_i)
  end

  def update
    @params = params
    @mytask = Task.find(params[:id].to_i)
    @mytask.title = params["task"]["title"]
    @mytask.description = params["task"]["description"]
    @mytask.details = params["task"]["details"]
    @mytask.completion_status = params["task"]["completion_status"]
    @mytask.completion_date = params["task"]["completion_date"]
    @mytask.save

  end

  def mark_complete
    @mytask = Task.find(params[:id].to_i)
    @mytask.completion_status = "true"
    @mytask.completion_date = Time.now
    @mytask.save
    redirect_to index_path
  end

  #
  # def self.allposts
  #   [
  #     {id: 1, title: "pay bills", description: "financial task", details: "T-Mobil due", completion_status: false, completion_date: nil}, {id: 2, title: "dentist appointment", description: "wellness task", details: "Malika needs check-up", completion_status: true, completion_date: "09/15/2016"}, {id: 3, title: "call pharmacy", description: "wellness task", details: "check status of humera", completion_status: false, completion_date: nil}
  #   ]
  # end

  private
  def user_params
    params.require(:task).permit(:title, :description, :completion_status, :completion_date)
  end

end
