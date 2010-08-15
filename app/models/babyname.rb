class Babyname 
	include MongoMapper::Document
	
	key :name, String, :required => true
	key :is_girl, Boolean, :required => true
	key :num_votes, Integer
	timestamps!

  key :poll_id, ObjectId
  belongs_to :poll

  def self.vote(nameid)
    Babyname.increment(nameid, :num_votes => 1)
  end

end
