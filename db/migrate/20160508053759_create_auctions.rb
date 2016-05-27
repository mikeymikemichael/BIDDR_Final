class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :item
      t.text :details
      t.datetime :end_date
      t.integer :reserve_price
      t.integer :current_bid
      t.integer :user_id
      t.timestamps null: false

    end
  end
end
