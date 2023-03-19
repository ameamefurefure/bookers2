class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # def create
  #   @book = Book.new(book_params) # データ受取＆ストロングパラメータの確認
  #   @book.user_id = current_user.id # 受け取ったデータのuser_idカラムはログインユーザーのID
  #   @book.save # データベースに保存
  #   redirect_to book_path(@book.id)
  # end
  def create
    @book = Book.new(book_params) # データ受取＆ストロングパラメータの確認
    @book.user_id = current_user.id # 受け取ったデータのuser_idカラムはログインユーザーのID
    if @book.save # データベースに保存
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end
  

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new # データ受取＆新規登録
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id]) #bookの取得
    if @book.update(book_params) #bookのアップデート
      redirect_to book_path(@book.id) #bookの詳細ページへのパス
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])# 削除するbookレコードを取得
    book.delete# book削除
    redirect_to books_path# bookの一覧ページへのパス
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
