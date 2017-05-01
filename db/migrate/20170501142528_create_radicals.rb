class CreateRadicals < ActiveRecord::Migration[5.1]
  def change
    create_table :radicals do |t|
      t.string :character
      t.integer :strokes

      t.timestamps
    end
  end
end
