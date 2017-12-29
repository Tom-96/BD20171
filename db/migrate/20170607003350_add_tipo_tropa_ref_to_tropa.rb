class AddTipoTropaRefToTropa < ActiveRecord::Migration[5.1]
  def change
    add_reference :tropas, :tipo_tropa, foreign_key: true
  end
end
