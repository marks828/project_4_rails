class BetsController < ApplicationController

  def index
    @bets = Bet.all

    render json: @bets
  end

  def show
    @bet = Bet.find(params[:id])

    render json: @bet
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.create(bet_params)

    @bet.save
    render json: @bet
  end

  def edit
    @bet = Bet.find(params[:id])
  end

  def update
    @bet = Bet.find(params[:id])
    @bet.update(bet_params)
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
  end

  private
  def bet_params
    params.permit(:bet, :amount, :winner)
  end

end
