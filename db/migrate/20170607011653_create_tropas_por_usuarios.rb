class CreateTropasPorUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :tropas_por_usuarios, id: false do |t|
      t.references :user, foreign_key: true
      t.references :tropa, foreign_key: true
      t.datetime :fecha
      t.integer :curr_atk
      t.integer :curr_def

      t.timestamps
    
    end

      add_index :tropas_por_usuarios, ["user_id", "tropa_id", "fecha"], :unique => true
    
  end
end
