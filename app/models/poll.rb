class Poll 
	include MongoMapper::Document
	
	key :title, String
	key :story, String
	key :ins_at, Date
	timestamps!

	many :babynames

	
end
