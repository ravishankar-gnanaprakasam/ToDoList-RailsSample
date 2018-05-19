class StaticPagesController < ApplicationController
  def home
  	if is_signed_in?
  		@task = current_user.tasks.build if is_signed_in?
  		@open_items = current_user.open_items.paginate(page: params[:page])
      @closed_items = current_user.closed_items.paginate(page: params[:page])
  	end
  end

  def help
  end

  def about
  end
end
