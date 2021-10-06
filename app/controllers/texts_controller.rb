class TextsController < ApplicationController
  def index
    @texts = Text.genre_categorize(params[:genre])
  end

  def show; end
end
