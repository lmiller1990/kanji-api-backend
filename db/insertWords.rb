require 'json'
require 'sqlite3'

#file = File.read "output2.js"
file = File.read "allRadicals.js"

data = JSON.parse(file)
db = SQLite3::Database.open 'development.sqlite3'

queries = []
data.each do |r|
  rs = ''

  query = ''
  #query = "INSERT INTO Japanese_Words (word, meaning, radicals, created_at, updated_at) VALUES (" + '"' + "#{r["word"]}" + '",' + '"' +  " #{r["meaning"]}"+ '","' +  "#{r["radicals"]}" + '", "' +  Time.now.to_s + '", "' + Time.now.to_s + '")'

  queries.push(query)
end

i = 0
queries.each do |q|
  i += 1
   # db.execute q
  if i % 1000 == 1
    p i
  end
end



