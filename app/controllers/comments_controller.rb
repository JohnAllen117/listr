class CommentsController < ApplicationController
  before_action :signed_in?, only: [:new, :create, :edit, :update, :destroy]
  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    @comment = Comment.new(comment_params)
    @list = @comment.list 
    if @comment.save
      flash[:notice] = "Comment Created"
      redirect_to list_path(@list)
    else
      flash[:notice] = "Invalid Entry"
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
