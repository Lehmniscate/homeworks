class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    render books: :new
  end

  def create
    Book.create(book_params)

    redirect_to :books
  end

  def destroy
    book = Book.find_by(id: params[:id])

    book.destroy

    redirect_to :books
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
