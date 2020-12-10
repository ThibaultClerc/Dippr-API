class Api::SearchController < ApplicationController
  def search
    @market_dishes = MarketDish.search_by_term(search_params[:query])
  end

  private

  def search_params

  end

end
