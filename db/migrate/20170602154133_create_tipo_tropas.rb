class CreateTipoTropas < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_tropas do |t|
      t.string :nombre
      t.integer :boni_atk
      t.integer :boni_def

      t.timestamps
    end
  end
end
