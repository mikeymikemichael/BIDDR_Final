require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  describe "new" do
    it "renders new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "instantiates new object set to @auction" do
      get:new
      expect(assigns(:auction)).to be_a_new(Auction)
    end
  end

  describe "#create" do

    context "with valid attributes" do
      def valid_request
        post :create, auction:{title: "valid title",
        details: "valid details",
        end_date: 60.days.from_now}
      end

      it "creates a record in the database" do
        auction_count_before = Auction.count
        valid_request
        expect(auction_count_after - auction_count_before).to eq(1)
      end
    end

    context "with invalid attributes" do

      def invaild_request
        post :create, auction:{title: "valid name",
        details: nil,
        end_date: 60.days.from_now}
      end

      it "doesn't create record in database" do
        auction_count_before = Auction.count
        invalid request
        auction_count_after = Auction.cunt
        expect(auction_count_before).to eq(auction_count_after)
      end


    end

  end

end
