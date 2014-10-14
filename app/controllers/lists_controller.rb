class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    @user = current_user
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    binding.pry
    @list.categories = params[:list][:category_ids]
    if @list.save
      flash[:notice] = "List Created"
      redirect_to list_path(@list)
    else
      flash[:notice] = "Invalid Entry"
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    authenticate_user_for_action!
  end

  def update
    authenticate_user_for_action!
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "List updated"
      redirect_to list_path(@list)
    else
      flash[:notice] = "Invalid Entry"
      render :edit
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :content, :category_ids)
  end

  def authenticate_user_for_action!
    unless current_user == @list.user
      flash[:notice] = "You aren't authorized to do that."
      redirect_to 'root_path'
    end
  end

  def signed_in?
    unless current_user
      flash[:notice] = "You must sign in first!"
      redirect_to 'root_path'
    end
  end
end
