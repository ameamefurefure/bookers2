class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new # データ受取＆新規登録
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    # @books = @user.books.page(params[:page]) #ページネーションの為、こっちに変更?
  end

  # def user_params
  #   params.require(:user).permit(:title, :body, :profile_image)
  # end

  def edit
    @user = User.find(params[:id])
    # @user.save
    # redirect_to user_path(current_user.id)
  end

  def update
    user = User.find(params[:id]) #ユーザーの取得
    user.update(user_params) #ユーザーのアップデート
    redirect_to user_path(user.id) #ユーザーの詳細ページへのパス
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
