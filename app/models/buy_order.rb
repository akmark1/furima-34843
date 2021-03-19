class BuyOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :state, :city, :house_number, :room_number, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :zip_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :room_number
    validates :phone_number, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :state
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Order.create(zip_code: zip_code, state_id: state, city: city, house_number: house_number, room_number: room_number, phone_number: phone_number, buy_id: buy.id)
  end
end