class TextsController < ApplicationController
  def index
    @texts = Text.includes(:read_progresses).order(:created_at)
  end

  def show; end
end
