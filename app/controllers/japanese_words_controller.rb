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

  def meaning
    word = params[:word]
    definition = JapaneseWord.where(word: word)

    json_response(definition)
  end
end
