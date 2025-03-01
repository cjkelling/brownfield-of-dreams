class WelcomeController < ApplicationController
  def index
    if params[:tag]
      @tutorials = Tutorial.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 5)
    else
      @tutorials = Tutorial.all.paginate(page: params[:page], per_page: 5)
    end
    @tutorials = @tutorials
      .merge(Tutorial.non_classroom_content) unless current_user
  end
end
