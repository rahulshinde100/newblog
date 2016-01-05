class CommentsController < ApplicationController
    before_filter :authenticate_user!, :except => [ :index, :show ]
  before_action :set_comment, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    #raise params.inspect
    @comments = Post.find(params[:post_id]).comments#.all
    respond_with(@comments)
  end


    def display

      #raise params.inspect
      
    end


  def show
    #raise params.inspect
    respond_with(@comments)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    #raise params.inspect
    @comment = Comment.new(comment_params)
    @comment.save
    #respond_with(@comment)
    # @post =Post.new
    redirect_to posts_path
  end

  def update
    @comment.update(comment_params)
    respond_with(@comments)
  end

  def destroy
    @comment.destroy
    respond_with(@comments)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params

       params["comment"].merge!(user_id: current_user.id)
      params.require(:comment).permit(:comment_string , :user_id , :post_id)
    end
end
