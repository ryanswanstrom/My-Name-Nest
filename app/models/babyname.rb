class Babyname 
	include MongoMapper::Document
	
	key :name, String
	key :is_girl, Boolean
	key :num_votes, Integer
  key :poll_id, String
  key :uid, Integer
  #timestamps!

#	belongs_to :poll
	#many :votes
end
