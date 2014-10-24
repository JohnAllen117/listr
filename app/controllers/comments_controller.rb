class CommentsController < ApplicationController
  before_action :signed_in?, only: [:new, :create, :edit, :update, :destroy]
  def new
    @comment = Comment.new
    @list = List.find(params[:list_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = User.find(current_user)
    @comment.list = List.find(params[:list_id])
    if @comment.save
      flash[:notice] = "Comment Created"
      redirect_to list_path(@comment.list)
    else
      flash[:notice] = "Invalid Entry"
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @list = @comment.list
    authenticate_user_for_action!(@comment)
  end
  
  def update
    @comment = Comment.find(params[:id])
    authenticate_user_for_action!(@comment)
    if @comment.update(comment_params)
      flash[:notice] = "Comment updated"
      redirect_to list_path(@comment.list)
    else
      flash[:notice] = "Invalid Entry"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @list = @comment.list 
    authenticate_user_for_action!(@comment)

    Comment.destroy(@comment.id)

    redirect_to list_path(@list.id), notice: "Comment deleted."
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
