Rails.application.routes.draw do
  get 'radicals/index'
  get 'japanese_words/words_by_radicals'
  get 'japanese_words/meaning'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
