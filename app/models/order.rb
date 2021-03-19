class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state

  belongs_to :buy

  ##with_options presence: true do
    #validates :zip_code, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }
    #validates :city
    #validates :house_number
    #validates :room_number
    #validates :phone_number, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }
  #end

  #with_options numericality: { other_than: 1 } do
    #validates :state_id
  #end

end
