class Poll 
	include MongoMapper::Document
	
	key :title, String
	key :story, String
  #this needs to be a list
  #key :baby_name, Babyname
	timestamps!
  key :babyname_ids, Array

  def babynames
    Babyname.find(self.babyname_ids)
  end

#	many :babynames

	
end
