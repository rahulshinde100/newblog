class TagsController < ApplicationController
    before_filter :authenticate_user!, :except => [ :index, :show ]
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tags = Tag.all
    respond_with(@tags)
  end

  def show

      #raise params.inspect

      @comment = Comment.new
      @tag = Tag.find_by_permalink(params[:id])
      @posttag =Posttag.where(:tag_id => @tag.id)
   # respond_with(@tag)
  end

  def new
     @category = Category.find_by_permalink(params[:category_id])
    @tag = Tag.new
    respond_with(@tag)
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to categories_path
  end

  def update
    @tag.update(tag_params)
    redirect_to categories_path
  end

  def destroy
    @tag.destroy
    respond_with(@tag)
  end

  private
    def set_tag
      @tag = Tag.find_by_permalink(params[:id])
    end

    def tag_params
       params["tag"].merge!(user_id: current_user.id)
      params.require(:tag).permit(:tag_title , :user_id)
    end
end
