class RecursosPorUsuario < ApplicationRecord
  belongs_to :user
  belongs_to :recurso
end
