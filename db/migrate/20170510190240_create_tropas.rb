class CreateTropas < ActiveRecord::Migration[5.1]
  def change
    create_table :tropas do |t|
      t.string :nombre
      t.integer :atk
      t.integer :def

      t.timestamps
    end
  end
end
