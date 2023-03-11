class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    # @books = @user.books.page(params[:page]) #ページネーションの為、こっちに変更?

  end

  def edit
  end
end
