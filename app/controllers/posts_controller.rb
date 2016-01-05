class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def rahulcategory
    #raise params.inspect
    @temp = Category.find(params[:id])
    @post =Post.where(:category_id => @temp.id)
          
  end
    

  def show
    @comment = Comment.new
    respond_with(@post)
  end

  def new
    @post = Post.new
    @all_tags =Tag.all
    @post_tag = @post.posttags.build

    @comment = Comment.new

  
   
    

    respond_with(@post)
  end

  def edit
  end

  def create
    #raise params.inspect
    user_id = current_user.id
    params["post"].merge!(user_id: current_user.id)
    @post = Post.new(post_params)
    @post.save
    some_hash = params.require(:tags)
   
   


    s = some_hash["id"].size
      for i in 0..s
      ch = some_hash["id"][i]
        if ch.to_s.empty?
        else
          
          @tag = Posttag.new(:post_id => @post.id , :tag_id => ch.to_i )
          @tag.save
      end
    end
   
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
   

    #@tags = Posttag.where(:post_id => @post.id)
p "===================================="
    #p @tags
    Posttag.where(:post_id => params[:id]).destroy_all
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      #user_id = current_user.id
      params["post"].merge!(user_id: current_user.id)
      params.require(:post).permit(:title, :description , :user_id , :category_id)
    end
   
end
