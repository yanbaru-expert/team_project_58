class MoviesController < ApplicationController
  PER_PAGE = 12
  def index
    @movies = Movie.includes(:watch_progresses).order(:created_at).genre_list(params[:genre]).page(params[:page]).per(PER_PAGE)
  end
end
