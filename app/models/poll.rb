class Poll 
	include MongoMapper::Document
	
	key :title, String
	key :story, String
  key :babyname_ids, Array
	timestamps!

  def babynames
    puts @babyname_ids
    Babyname.find(self.babyname_ids)
  end

  def add_babyname(name, is_girl)
    babyname = Babyname.new()
    babyname.name = name
    babyname.is_girl = is_girl
    babyname.num_votes = 0
    babyname.save
    @babyname_ids << babyname.id
  end

end
