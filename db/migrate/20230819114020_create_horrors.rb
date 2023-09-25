class CreateHorrors < ActiveRecord::Migration[6.1]
  def change
    create_table :horrors do |t|
      t.string :title
      t.text :sentence

      t.timestamps
    end
  end
end
