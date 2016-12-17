class DecksController < ApplicationController
  #before_action :set_deck, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /decks
  # GET /decks.json
  def index
    @decks = Deck.all
  end

  # GET /decks/1
  # GET /decks/1.json
  def show
    @deck = Deck.find(params[:id])
  end

  # GET /decks/new
  def new
    @deck = current_user.decks.new
  end

  # GET /decks/1/edit
  def edit
    @deck = current_user.decks.find(params[:id])
  end

  # POST /decks
  # POST /decks.json
  def create
    @deck = current_user.decks.new(deck_params)
    respond_to do |format|
      if @deck.save
        format.html { redirect_to @deck, notice: 'Deck was successfully created.' }
        format.json { render :show, status: :created, location: @deck }
      else
        format.html { render :new }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    @deck = current_user.decks.find(params[:id])
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to @deck }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck = current_user.decks.find(params[:id])
    @deck.destroy
    respond_to do |format|
      format.html { redirect_to decks_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_params
      params.require(:deck).permit(:cards, :size)
    end
end
