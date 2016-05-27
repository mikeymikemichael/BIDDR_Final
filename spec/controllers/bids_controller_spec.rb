require 'rails_helper'

RSpec.describe BidsController, type: :controller do

  describe "#create" do

    context "with valid attributes" do
      def valid_request
        post :create, auction_id: auction.id, bid: {amount:}
      end

    it "creates a ecord in the database" do
      bid_count_before = Bid.count
      valid_request
      bid_count_after = Bid.count
      expect(bid_count_after - bid_count_before).to eq(1)
      end
    end

    context "with invalid attributes" do
      def invalid_request
        post :create, auction_id: auction.id, bid: {amount:}
      end

      it "doesn't create a record in the database" do
        bid_count_before = Bid.count
        invalid_request
        bid_count_after = Bid.count
        expect(bid_count_before).to eq(bid_count_after)
      end
    end

  end

  
end
