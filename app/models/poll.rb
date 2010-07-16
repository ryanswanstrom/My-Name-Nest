class Poll 
	include MongoMapper::Document
	
	key :title, String
	key :story, String
end
