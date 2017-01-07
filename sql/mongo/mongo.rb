#https://docs.mongodb.com/ruby-driver/master/ruby-driver-tutorials/
require 'mongo'

client = Mongo::Client.new('mongodb://127.0.0.1:27017/testdb')

#Create
collection = client[:people]

#db = client.database

#p db.collections
#p db.collection_names

#Insert

doc = { name: 'Dodo', hobbies: [ 'hiking', 'tennis', 'fly fishing' ] }

result = collection.insert_one(doc)
#p result.n

#Insert multiple
docs = [ { _id: 10, name: 'Leo', hobbies: [ 'hiking', 'tennis', 'fly fishing' ] },
         { _id: 11, name: 'Den', hobbies: ['skiing', 'stamp collecting' ] } ]

#result = collection.insert_many(docs)
#p result.inserted_count

collection.find.each do |document|
  #p document
end

collection.find( { name: 'Steve' } ).each do |document|
  #p document
end

#puts collection.find( { name: 'Steve' } ).first

#Update
result = collection.update_one( { 'name' => 'Steve' }, { '$set' => { 'phone_number' => "555-555-5555" } } )
puts collection.find( { 'name' => 'Steve' } ).first

result = collection.update_many( {}, { '$set' => { 'age' => 36 } } )
puts result.modified_count

#Delete
result = collection.delete_one( { name: 'Den' } )
puts result.deleted_count

#Index
#collection.indexes.create_one({ name: 1 }, unique: true)
