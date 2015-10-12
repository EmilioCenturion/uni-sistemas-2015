class CuponEmitido < ActiveRecord::Base
  belongs_to :credit_card
  belongs_to :cuentum, :through => :credits 
end
