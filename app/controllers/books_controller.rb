class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    list = Book.new(book_params) # データ受取＆新規登録
    list.save # データベースに保存
    redirect_to '/books/#{book.id}'
  end
  
  
  def index
  end

  def show
  end

  def edit
  end
end
