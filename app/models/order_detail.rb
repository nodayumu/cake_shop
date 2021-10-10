class OrderDetail < ApplicationRecord

  enum making_status: { unable: 0, make_waiting: 1, making: 2, completed: 3 }

  belongs_to :order

end
