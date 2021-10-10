class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { pay_waiting: 0, pay_confirm: 1, on_making: 2, ship_preparing: 3, completed: 4 }

  belongs_to :end_user
  has_many :order_details

  # belongs_to :addresses
  #　追記

end
