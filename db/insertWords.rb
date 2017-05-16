require 'json'
require 'sqlite3'

file = File.read "outputWithHiragana.js"
#file = File.read "allRadicals.js"

data = JSON.parse(file)
db = SQLite3::Database.open 'development.sqlite3'

queries = []
data.each do |r|

  query = "INSERT INTO Japanese_Words (word, meaning, radicals, hiragana, created_at, updated_at) VALUES (" + '"' + "#{r["word"]}" + '",' + '"' +  " #{r["meaning"]}"+ '","' +  "#{r["radicals"].to_s.gsub(/"/, ' ')}" + '","' + "#{r["hiragana"]}" + '","' +  Time.now.to_s + '", "' + Time.now.to_s + '")'
  #p query
  queries.push(query)
end



i = 0
queries.each do |q|
  i += 1
   db.execute q
  if i % 1000 == 1
    p q
    p i
  end
end



