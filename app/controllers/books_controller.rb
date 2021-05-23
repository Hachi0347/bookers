class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
      @book = Book.new(books_params)
    if  @book.save
      redirect_to book_path(@book.id)
      flash[:success] = "Book was successfully created."
    else
      @books = Book.all
      render :index
    end
  end

  def edit
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(books_params)
      redirect_to book_path(@book.id)
      flash[:info] = "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_path
      flash[:notice] = "Book was successfully destroyed."
    else
      flash.now[:alert] = "Book wasn't destroyed."
      render :index
    end
  end

  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
end