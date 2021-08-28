class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @movies = Movie.all
    @bm = Bookmark.new
  end

  def create
    @bm = Bookmark.new(bm_sp)
    @list = List.find(params[:list_id])
    @bm.list = @list
    if @bm.save
      redirect_to lists_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bm = Bookmark.find(params[:id])
  end

  private

  def bm_sp
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
