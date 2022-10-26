# frozen_string_literal: true

class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @user = user
    @users = User.all
  end

  def create
    @user = user
    movie = MovieFacade.movie_details(params[:movie_id])
    @party = Party.new(party_params)
    @users = User.all
    if @party.save
      UserParty.create!(user_id: @user.id, party_id: @party.id)

      @users.each do |user|
        UserParty.create!(user_id: user.id, party_id: @party.id) if params[user.id.to_s] == "1"
      end
      redirect_to(dashboard_path)
    end
  end

  private

  def party_params
    params.permit(:duration, :date, :start_time, :host_id, :movie_id)
  end
end
