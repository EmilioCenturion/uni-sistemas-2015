class ChequeRecibido < ActiveRecord::Base
  belongs_to :banco
  belongs_to :cliente
end
