class JapaneseWordsController < ApplicationController
  def meaning_by_kanji_and_radicals
    radicals = params[:radicals].reject { |c| c.empty? }
    kanji = params[:kanji].reject { |c| c.empty? }
    length = params[:length]

    radQuery = ""
    radicals.each_with_index do |rad, idx| 
      if (rad.length > 0)
        radQuery << "radicals LIKE '%#{rad}%'"
        radQuery  << " AND " unless idx + 1 == radicals.length
      end
    end

    wordQuery = ""
    kanji.each_with_index do |kan, idx| 
      wordQuery << "(word LIKE '%#{kan}%' or hiragana LIKE '%#{kan}%')"
      wordQuery << " AND " unless idx + 1 == kanji.length
    end

    lenQuery = ""
    if radicals.length > 0 && kanji.length > 0
      lenQuery << "length(japanese_words.word) = #{length}"
    end

    words = JapaneseWord.where(wordQuery).where(radQuery).where(lenQuery)
    json_response(words)
  end

  def meaning
    word = params[:word]

    definition = JapaneseWord.where(word: word).or(JapaneseWord.where(hiragana: word))

    json_response(definition)
  end
end
