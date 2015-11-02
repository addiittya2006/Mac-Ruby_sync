class RecipesController < ApplicationController
  def index
    if params.has_key?('search')
      if params[:search].present?
        @term = params[:search]
        @recipes = Recipe.for(@term)
      end
    else
      @term = 'chocolate'
      @recipes = Recipe.for(@term)
    end
  end
end
