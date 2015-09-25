class Banco < ActiveRecord::Base
	has_many :Pais
	has_many :Ciudads
end
