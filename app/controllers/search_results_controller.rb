class SearchResultsController < ApplicationController
  def index
    @search_results = Clip.all
  end
end
