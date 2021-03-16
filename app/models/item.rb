class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :state
  belongs_to :delively_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  end
end
