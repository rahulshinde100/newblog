class DashboardController < ApplicationController

	before_filter :authenticate_user!, :except => [ :index, :show ]
  def index

  	@posts = Post.all
    #respond_with(@posts)
  end
end
