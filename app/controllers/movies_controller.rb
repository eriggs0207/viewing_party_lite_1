# frozen_string_literal: true

class MoviesController < ApplicationController
  def show
    @user = user
    @movie = MovieFacade.movie_details(params[:id])
    @cast = MovieFacade.lead_roles(params[:id])
    @reviews = MovieFacade.movie_critics(params[:id])
  end

  def index
    @movies = if params[:search]
                MovieFacade.search_results(params[:search])
              else
                MovieFacade.top_20_movies
              end
    @user = user
  end
end
