class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :state
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :value, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }, inclusion: { in: 300..9999999 }
    validates :image
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_id
    validates :state_id
    validates :delivery_day_id
  end

end
