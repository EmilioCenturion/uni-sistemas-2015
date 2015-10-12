class Chequera < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :personal
  has_many :cheque_emitidos
end
