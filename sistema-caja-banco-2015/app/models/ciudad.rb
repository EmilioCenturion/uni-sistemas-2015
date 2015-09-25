class Ciudad < ActiveRecord::Base
	belongs_to :Banco
	def name_ciudad
		"#{nombre}"
	end
end
