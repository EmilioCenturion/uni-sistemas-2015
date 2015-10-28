class AperturaCaja < ActiveRecord::Base
  belongs_to :caja
  belongs_to :user
end
