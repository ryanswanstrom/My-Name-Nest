class Vote 
	include MongoMapper::Document
	
	key :ins_at, Date
	belongs_to :babyname
end
