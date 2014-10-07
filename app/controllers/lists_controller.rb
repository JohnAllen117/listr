class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      flash[:notice] = "List Created"
      redirect_to list_path(@list)
    else
      flash[:notice] = "Invalid entry"
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "List updated"
      redirect_to list_path(@list)
    else
      flash[:notice] = "Invalid entry"
      render :edit
    end
  end

  def like
    @list = List.find(params[:id])
    @list.likes += 1
  end
  
  private

  def list_params
    params.require(:list).permit(:title, :content)
  end
end
