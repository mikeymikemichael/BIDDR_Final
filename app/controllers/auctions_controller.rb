class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show]

  def index
    @auctions = Auction.all
  end


  def new
    @auction = Auction.new
  end


  def create
    @auction = Auction.new(auction_params)
    if @auction.reserve_price
      @auction.current_price = @auction.reserve_price
    else
      @auction.current_price = 0
    end
    @auction.user = User.first
    if @auction.save
      flash[:notice] = "Your item has been submitted to auction"
      redirect_to auction_path(@auction)
    else
      flash[:alert] = "Your item has not been submitted to auction"
      render 'new'
    end
  end


  def show
    @auction = Auction.find(params[:id])
    @bid = Bid.new
  end

  private

    def set_auction
      @auction = Auction.find(params[:id])
    end


    def auction_params
      params.require(:auction).permit(:item, :reserve_price, :details, :auction_end_date)
    end

end
