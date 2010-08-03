class Poll 
	include MongoMapper::Document
	
	key :title, String
	key :story, String
  key :babyname_ids, Array
	timestamps!
  
  validates_length_of :title, :maximum => 5
  validates_length_of :story, :maximum => 5

  def babynames
    Babyname.find(self.babyname_ids)
  end

  def add_babyname(name, is_girl)
    babyname = Babyname.new()
    babyname.name = name
    babyname.is_girl = is_girl
    babyname.num_votes = 0
    puts "some error" unless babyname.save
    puts "babyname_ids are nil" unless @babyname_ids
    @babyname_ids << babyname.id
  end

end
