class AddHiraganaToJapaneseWords < ActiveRecord::Migration[5.1]
  def change
    add_column :japanese_words, :hiragana, :string
  end
end
