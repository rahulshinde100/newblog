class CategoriesController < ApplicationController
    before_filter :authenticate_user!, :except => [ :index, :show ]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    #@categories = Category.all

     @posts = Post.all
    @comment = Comment.new

    @categories=Category.all

  
    #@categories = Post.find(:id => params[:post_id])#.all
    respond_with(@categories)
  end


  def postwisesearch

    #raise params.inspect
    @comment =Comment.new
    @post = Post.find_by_permalink(params[:id])
   # raise @posts.inspect
      
    end 

  def tagwisesearch
     @comment = Comment.new
      @tag = Tag.find_by_permalink(params[:id])
      @posttag =Posttag.where(:tag_id => @tag.id)

      #raise @posttag.inspect
  end

  def rahulcategory
    #raise params.inspect
    @comment = Comment.new

    @category = Category.find_by_permalink(params[:id])
    @post =Post.where(:category_id => @category.id)
          
  end




  

  def show
    @categories = Category.all
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to categories_path
  end

  def update
    @category.update(category_params)
  redirect_to categories_path
  end

  def destroy
    @category.destroy
   redirect_to categories_path
  end

  private
    def set_category
      @category = Category.find_by_permalink(params[:id])
    end

    def category_params
       params["category"].merge!(user_id: current_user.id)
      params.require(:category).permit(:title , :user_id)
    end
end
