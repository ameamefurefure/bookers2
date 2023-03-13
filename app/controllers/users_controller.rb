class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    # @books = @user.books.page(params[:page]) #ページネーションの為、こっちに変更?
  end
  
  def user_params
    params.require(:user).permit(:title, :body, :profile_image)
  end

  def edit
  end
end
