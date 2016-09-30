class TasksController < ApplicationController
  
  def index
    @tasks = Tasks.all
  end

  def create
    @params = params
    @mytask = Task.new
    @mytask = params[:task][:title]
    @mytask = params[:task][:description]
    @mytask = params[:task][:details]
    @mytask = params[:task][:completion_status]
    @mytask = params[:task][:completion_date]
    @mypost.save
  end


  def new
    @mytask = Post.new
  end

  def show
    @mytask = Task.find(params[:id].to_i)
  end

  def destroy
  end

  def edit
    @tasks = TasksController.allposts
    @mytask = nil
    @found = false
    @tasks.each do |task|
      number = params[:id].to_i
      if task[:id] == number
        @mytask = task
        @found = true
      end
    end
    if @mytask == nil
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def update
    @tasks = Task.all
    @tasks.each do |task|
      number = params[:id].to_i
      if task[:id] == number
        @mytask = task
      end
    end
    if @mytask == nil
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end


  def self.allposts
    [
      {id: 1, title: "pay bills", description: "financial task", details: "T-Mobil due", completion_status: false, completion_date: nil}, {id: 2, title: "dentist appointment", description: "wellness task", details: "Malika needs check-up", completion_status: true, completion_date: "09/15/2016"}, {id: 3, title: "call pharmacy", description: "wellness task", details: "check status of humera", completion_status: false, completion_date: nil}
    ]
  end

  private
  def user_params
    params.require(:task).permit(:title, :description, :completion_status, :completion_date)
  end

end
