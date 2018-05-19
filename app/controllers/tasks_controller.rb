class TasksController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy


  def index
    @tasks = current_user.tasks.paginate(page: params[:page])
  end


  def create
  	@task = current_user.tasks.build(params[:task])
    puts @task.target_dt
  	if @task.save
  		flash[:success] = "Item Added"
  		redirect_to root_url
  	else
      #redirect_to root_url
      @open_items = current_user.open_items
      @closed_items = current_user.closed_items
  		render 'static_pages/home' # To display the error form
  	end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end


  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:success] = "Item Updated!"
      redirect_to root_url
    else
      #redirect_to root_url
      render 'edit' #To display the error form
    end

  end

  def destroy
    @task.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @task = current_user.tasks.find_by_id(params[:id])
      redirect_to root_url if @task.nil?
    end

end
