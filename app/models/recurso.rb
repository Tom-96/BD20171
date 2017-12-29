class Recurso < ApplicationRecord
	has_many :tropas

	has_many :recursos_por_usuarios
  has_many :users, :through => :recursos_por_usuarios
end
