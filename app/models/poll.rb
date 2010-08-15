class Poll 
	include MongoMapper::Document
	
	key :title, String
	key :story, String
	timestamps!
  has_many :babynames

  validates_length_of :title, :maximum => 50, :message => "allows only 50 characters"
  validates_length_of :story, :maximum => 5000, :message => "allows only 5000 characters"
  
  def babynames_attributes=(babynames_attributes)
    babynames_attributes.each do |attributes|
      babynames.build(attributes)
    end
  end

end
