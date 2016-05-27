class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :item, presence: true, length: {minimum: 2, maximum: 50}
  validates :reserve_price, presence: true
  validates :details, presence: true, length: {minimum: 10, maximum: 300}
  # validates :end_date, presence: true
  validates :user_id, presence: true

end
