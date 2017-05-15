require 'sqlite3'
require 'json'

rads = []
File.open("allRadicals.js", "r").each_line do |line|
  l = line[0...-2] unless !line.include? "char"
  if !l.nil?
    rads.push(eval l)
  end
end

queries = []
rads.each do |r|
  query = "INSERT INTO Radicals (character, strokes, name, created_at, updated_at) VALUES (" + '"' + "#{r[:char]}" + '"' + ", #{r[:strokes]}," + '"' + "#{r[:name]}" + '"' + Time.now.to_s + '", "' + Time.now.to_s + '")'

  p query
  queries.push(query)
end
db = SQLite3::Database.open 'development.sqlite3'
 
i = 0
data = []

queries.each do |d|
  i += 1
  # db.execute d
  p i
  # q = 'INSERT INTO japanese_words (word, meaning, created_at, updated_at) values ("' + d[0] + '", "' + d[1] + '", "' + Time.now.to_s + '", "' + Time.now.to_s + '")'
  # db.execute q
  # p i
end
# q = 'INSERT INTO japanese_words (word, meaning, created_at,updated_at) VALUES ("刀", "Sword","' + Time.now.to_s + '","' + Time.now.to_s + '")'
#db.execute 'SELECT * FROM japanese_words' do |word|
#  p word
#end
