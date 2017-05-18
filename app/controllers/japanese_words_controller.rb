class JapaneseWordsController < ApplicationController
  def words_by_radicals
    search_terms = params[:radicals]
    query = ""
    search_terms.each_with_index do |radical, idx| 
      query << "radicals LIKE '%#{radical}%'"
      query << " AND " unless idx + 1 == search_terms.length
    end

    words = JapaneseWord.where(query)

    json_response(words)
  end

  def meaning_by_kanji_and_radicals
    radicals = params[:radicals]
    kanji = params[:kanji]
    length = params[:length]
    p length
    radicalQuery = ""
    radicals.each_with_index do |rad, idx|
      radicalQuery << "radicals LIKE '%#{rad}%'" 
      radicalQuery << " AND " unless idx + 1 == radicals.length
    end

    wordQuery = ""
    kanji.each_with_index do |kan, idx| 
      wordQuery << "word LIKE '%#{kan}%'"
      wordQuery << " AND " unless idx + 1 == kanji.length
    end

    query = ""
    if radicals.length > 0 && kanji.length > 0
      query = radicalQuery << " AND " << wordQuery
    elsif radicalQuery.length == 0 && kanji.length > 0
      query = wordQuery
    else
      query = radicalQuery
    end

    query << " AND length(japanese_words.word) > #{length}"
    words = JapaneseWord.where(query)

    json_response(words)
  end

  def meaning
    word = params[:word]

    definition = JapaneseWord.where(word: word).or(JapaneseWord.where(hiragana: word))

    json_response(definition)
  end
end
