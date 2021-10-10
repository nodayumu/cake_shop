class Address < ApplicationRecord

  belongs_to :end_user

  # validates :name, :postal_code, :address, presence: true

  # has_many :orders

  def full_address
    postal_code + address + name
  end

end
