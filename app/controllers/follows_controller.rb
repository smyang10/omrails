class FollowsController < ApplicationController
	before_action :authenticate_user!

	def create
		#user = User.find_by(username: params[:username])
		#Follow.create(followable: user, follower: current_user)
		#redirect_to user_path(user.username), notice: "Followed user!"
		deck = Deck.find_by(id: params[:id])
		Follow.create(followable: deck, follower: current_user)
		redirect_to deck_path(deck.id), notice: "Followed deck!"
	end

	def destroy
		deck = Deck.find_by(id: params[:id])
		Follow.find_by(followable: deck, follower: current_user).destroy
		redirect_to deck_path(deck.id), notice: "Unfollowed deck!"
	end
end
