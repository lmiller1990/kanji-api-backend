class CreateJapaneseWords < ActiveRecord::Migration[5.1]
  def change
    create_table :japanese_words do |t|
      t.string :word
      t.string :meaning
      t.string :radicals

      t.timestamps
    end
  end
end
