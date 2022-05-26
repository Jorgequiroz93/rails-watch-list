class BookmarksController < ApplicationController
before_action :set_bookmark, only: [:update, :destroy]

  def create
      @bookmark = Bookmark.new(bookmark_params)
      if @bookmark.save
          redirect_to list_path(params[:list_id])
      else
       render :new
      end
  end
    
  def new
      @bookmark = Bookmark.new
      @list = List.find(params[:list_id])
  end

  def destroy
        if @bookmark.destroy
          redirect_to bookmark_path
        end
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
end

end
