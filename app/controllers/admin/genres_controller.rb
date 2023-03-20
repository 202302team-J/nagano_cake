class Admin::GenresController < ApplicationController
  def index
    @genre=Genre.new
    @genres=Genre.all
  end
  
  def create
    @genre=Genre.new
    @genre.save
  end
  
  def update
    @genre.update
  end

  def edit
    @genre=Genre.find(params[:id])
  end
end
