class ListsController < ApplicationController
  before_action :signed_in?, only: [:new, :create, :edit, :update, :destroy]
  def index
    @lists = List.populate_index_with(params)
  end

  def show
    @list = List.find(params[:id])
    if @list.private
      if current_user != @list.user || current_user.admin
        flash[:notice] = "This list is private"
        redirect_to root_path
      end
    end
    @comments = @list.comments.all
    if current_user
      @like = @list.liked_list(current_user)
    end
  end

  def new
    @list = List.new
    @user = current_user
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id

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
    authenticate_user_for_action!(@list)
  end

  def update
    @list = List.find(params[:id])
    authenticate_user_for_action!(@list)
    if @list.update(list_params)
      flash[:notice] = "List updated"
      redirect_to list_path(@list)
    else
      flash[:notice] = "Invalid Entry"
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    authenticate_user_for_action!(@list)

    List.destroy(@list.id)

    redirect_to root_path, notice: "List deleted."
  end

  private

  def list_params
    params.require(:list).permit(:title, :content, category_ids: [])
  end
end
