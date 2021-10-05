class Address < ApplicationRecord

  belongs_to :end_user

  validates :name, :postal_code, :address, presence: true

end
