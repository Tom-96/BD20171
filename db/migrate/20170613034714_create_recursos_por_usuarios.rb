class CreateRecursosPorUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :recursos_por_usuarios do |t|
      t.references :user, foreign_key: true
      t.references :recurso, foreign_key: true
      t.datetime :ultima_fecha
      t.integer :cantidad

      t.timestamps
    end
    add_index :recursos_por_usuarios, ["user_id", "recurso_id"], :unique => true
  end
end
