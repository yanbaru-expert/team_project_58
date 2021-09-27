class TextsController < ApplicationController
  def index
    @texts = Text::RAILS_GENRE_LIST
  end

  def show; end
end
