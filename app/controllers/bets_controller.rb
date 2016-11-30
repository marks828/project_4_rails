class BetsController < ApplicationController

  def index
    @bets = Bet.all

    render json: @bets
  end

  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.create(bet_params)

    @bet.save
    redirect_to bets_path
  end

  def edit
    @bet = Bet.find(params[:id])
  end

  def update
    @bet = Bet.find(params[:id])
    @bet.update(bet_params)
    redirect_to bets_path
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    redirect_to bets_path
  end

  private
  def bet_params
    params.require(:bet).permit(:bet, :amount, :winner)
  end

end
