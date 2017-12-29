class AddRecursoRefToTropa < ActiveRecord::Migration[5.1]
  def change
    add_reference :tropas, :recurso, foreign_key: true
    add_column :tropas, :cantidad_rec, :integer
  end
end
