class Credit < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :personal
end
