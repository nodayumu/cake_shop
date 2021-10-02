class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    flash[:notice] = '新規ジャンル追加しました'
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    flash[:notice] = '編集しました'
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end

end
