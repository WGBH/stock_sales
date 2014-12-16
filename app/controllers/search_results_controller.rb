class SearchResultsController < ApplicationController
  def index
    @clips = Clip.order(:created_at).page(params[:page])
  end
end
