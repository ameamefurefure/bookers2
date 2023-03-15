class BooksController < ApplicationController
  # def new
  #   @book = Book.new
  # end

  def create
    @book = Book.new(book_params) # データ受取＆ストロングパラメータの確認
    @book.user_id = current_user.id # 受け取ったデータに付随するuser_idはログインユーザーのID
    @book.save # データベースに保存
    # redirect_to '/books/#{book.id}'
    # redirect_to book_path(@book.id)
    redirect_to book_path(@book.id)
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new # データ受取＆新規登録
    # @book.save # データベースに保存
    # redirect_to root_path
  end

  def show
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
