class Item < ApplicationRecord

  attachment :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  # validates :genre_id, :item_name, :description, :image_id, :non_taxed_price, presence: true


end
