class Babyname 
	include MongoMapper::Document
	
	key :name, String
	key :is_girl, Boolean
	key :num_votes, Integer

	belongs_to :poll
	many :votes
end
