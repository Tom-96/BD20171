class TropasPorUsuario < ApplicationRecord
  belongs_to :user
  belongs_to :tropa
end
