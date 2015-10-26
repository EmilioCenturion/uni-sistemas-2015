class Ciudad < ActiveRecord::Base
	has_many :bancos
	def name_ciudad
		"#{nombre}"
	end

	validates :nombre, :uniqueness => {:message => "Ya existe esta ciudad"}

end
