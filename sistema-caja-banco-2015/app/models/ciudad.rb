class Ciudad < ActiveRecord::Base
	has_many :bancos
	def name_ciudad
		"#{nombre}"
	end
end
