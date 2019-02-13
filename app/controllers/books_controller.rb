class BooksController < ApplicationController
  def top
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
#ページ作成なし   
  def create
    book = Book.new(book_params)
    if  book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(book)
    else
      render("books")
    end
  end
  
  def show
        @book = Book.find(params[:id]) 
  end

  def edit
        @book = Book.find(params[:id])
  end
  
#ページ作成なし   
  def update
    book = Book.find(params[:id])
    if  book.update(book_params)
    flash[:notice] = "Book was successfully update."
    redirect_to book_path(book)
    else
      render("books")
    end
  end
#リダイレクト先のリンク指定方法
  
#ページ作成なし   
#引数がいらない理由  
  def destroy
    book = Book.find(params[:id])
    if   book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
    else
      render("books")
    end
  end

  private
  def book_params
        params.require(:book).permit(:title, :body)
  end
end
