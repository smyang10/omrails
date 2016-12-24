class VotesController < ApplicationController
	before_action :authenticate_user!

  def create
  	deck = Deck.find(params[:id])
  	deck.liked_by current_user
  	redirect_to decks_path, notice: "Voted for " + deck.title
  end

  def destroy
  	deck = Deck.find(params[:id])
  	deck.unliked_by current_user
  	redirect_to decks_path, notice: "Unvoted for " + deck.title
  end
end
