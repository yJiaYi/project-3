class ShoppinglistsController < ApplicationController
  def index
    @new_shoppinglist = Shoppinglist.new
    @shoplists = current_user.shoppinglists
  end

  def show
    @shoppinglist = Shoppinglist.find(params[:id])

  end
  def create
    current_user.shoppinglists.create(params.require(:shoppinglist).permit(:name_shoppinglist))
    # render :json => current_user.shoppinglists
    redirect_to action: "index"
  end
  def new
    @new_shoppinglist = Shoppinglist.new
  end

  def edit
    @shoppinglist = Shoppinglist.find(params[:id])
  end

  def update
    if Shoppinglist.find(params[:id]).update(params.require(:shoppinglist).permit(:name_shoppinglist))
      redirect_to action: "index"

    else
      flash[:alert]="Shopping list cannot update"
      render 'edit'
    end
  end

  def destroy
    Shoppinglist.destroy(params[:id])
    redirect_to action: "index"
  end
end
