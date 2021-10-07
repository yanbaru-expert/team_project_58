class TextsController < ApplicationController
  def index
    @texts = Text.includes(:read_progresses).genre_categorize(params[:genre]).order(:created_at)
  end

  def show; end
end
