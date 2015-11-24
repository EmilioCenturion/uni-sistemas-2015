class Personal < ActiveRecord::Base
  audited
  belongs_to :pai
  belongs_to :ciudad
  	def name_personal
		"#{nombre} - #{documento}"
	end
end
