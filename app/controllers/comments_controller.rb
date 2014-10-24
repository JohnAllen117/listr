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

  end

  def destroy

  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
