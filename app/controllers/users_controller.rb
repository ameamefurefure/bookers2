class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def index
    # @user = User.find(params[:id])
    # @books = @user.books
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    # @books = @user.books.page(params[:page]) #ページネーションの為、こっちに変更?
  end

  # def user_params
  #   params.require(:user).permit(:title, :body, :profile_image)
  # end

  def edit
    # @user = User.new(user_params)
    # @user.save
    # redirect_to user_path(current_user.id)
  end

  private

  # def user_params
  #   params.require(:user).permit(:name, :introduction, :image)
  # end
end
