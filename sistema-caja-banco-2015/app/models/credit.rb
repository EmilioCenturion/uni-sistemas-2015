class Credit < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :personal
  has_many :cupon_emitidos 
end
