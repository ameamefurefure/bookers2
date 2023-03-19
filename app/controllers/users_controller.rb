class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

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
    @books = @user.books
    # @books = @user.books.page(params[:page]) #ページネーションの為、こっちに変更?
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) #ユーザーの取得
    if @user.update(user_params) #ユーザーのアップデート
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id) #ユーザーの詳細ページへのパス
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
end