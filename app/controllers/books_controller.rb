class BooksController < ApplicationController
	  def top
	  end

  	def show
      @book = Book.find(params[:id])
  	end

  	def index
      @books = Book.all
      @book = Book.new
  	end

  	def new

  	end

  	def edit
      @book = Book.find(params[:id])
  	end


    def create
      book = Book.new(book_params)
      if  book.save
        flash[:notice] = "successfully"
        redirect_to books_path
      else
        render books_path
      end
    end

    def update
      book = Book.find(params[:id])
      if book.update(book_params)
        flash[:notice] = "successfully"
        redirect_to book_path(book.id)
      else
        render book_path(book.id)
      end
    end

    def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
    end

    private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
