class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end
  
  def show
    poll = Poll.find(params[:id])
    @title = poll.title
    @poll_id = poll.id
    @story = poll.story
    @created_at = poll.created_at
    @boys = Array.new
    @girls = Array.new
    poll.babynames.each do |thename|
      if thename.is_girl
        @girls << thename
      else
        @boys << thename
      end
    end
  end
  
  def new
    @poll = Poll.new
  end

  def save_poll
    @poll = Poll.new
    @poll.title = params[:title]
    @poll.story = params[:story]
#    @poll.save
    unless params[:boy_1].empty?
      b_name = Babyname.create
      b_name.name = params[:boy_1]
      b_name.is_girl = false
      b_name.num_votes = 0
#      b_name.uid = 1
#      b_name.poll_id = @poll.id
      b_name.save
      @poll.babyname_ids << b_name.id
    end
    unless params[:boy_2].empty?
      b_name = Babyname.create
      b_name.name = params[:boy_2]
      b_name.is_girl = false
      b_name.num_votes = 0
#      b_name.uid = 2
#      b_name.poll_id = @poll.id
      b_name.save
      @poll.babyname_ids << b_name.id
    end
    unless params[:boy_3].empty?
      b_name = Babyname.create
      b_name.name = params[:boy_3]
      b_name.is_girl = false
      b_name.num_votes = 0
#      b_name.uid = 3
#      b_name.poll_id = @poll.id
      b_name.save
      @poll.babyname_ids << b_name.id
    end
    unless params[:boy_4].empty?
      b_name = Babyname.create
      b_name.name = params[:boy_4]
      b_name.is_girl = false
      b_name.num_votes = 0
#      b_name.uid = 4
#      b_name.poll_id = @poll.id
      b_name.save
      @poll.babyname_ids << b_name.id
    end
    unless params[:boy_5].empty?
      b_name = Babyname.create
      b_name.name = params[:boy_5]
      b_name.is_girl = false
      b_name.num_votes = 0
#      b_name.uid = 5
#      b_name.poll_id = @poll.id
      b_name.save
      @poll.babyname_ids << b_name.id
    end


    unless params[:girl_1].empty?
      b_name = Babyname.create
      b_name.name = params[:girl_1]
      b_name.is_girl = true
      b_name.num_votes = 0
#      b_name.uid = 6
#      b_name.poll_id = @poll.id
      b_name.save
      @poll.babyname_ids << b_name.id
    end
    unless params[:girl_2].empty?
      b_name = Babyname.create
      b_name.name = params[:girl_2]
      b_name.is_girl = true
      b_name.num_votes = 0
#      b_name.uid = 7
#      b_name.poll_id = @poll.id
      b_name.save
      @poll.babyname_ids << b_name.id
    end
    unless params[:girl_3].empty?
      b_name = Babyname.create
      b_name.name = params[:girl_3]
      b_name.is_girl = true
      b_name.num_votes = 0
#      b_name.uid = 8
#      b_name.poll_id = @poll.id
      b_name.save
      @poll.babyname_ids << b_name.id
    end
    unless params[:girl_4].empty?
      b_name = Babyname.create
      b_name.name = params[:girl_4]
      b_name.is_girl = true
      b_name.num_votes = 0
#      b_name.uid = 9
#      b_name.poll_id = @poll.id
      b_name.save
      @poll.babyname_ids << b_name.id
    end
    unless params[:girl_5].empty?
      b_name = Babyname.create
      b_name.name = params[:girl_5]
      b_name.is_girl = true
      b_name.num_votes = 0
#      b_name.uid = 10
#      b_name.poll_id = @poll.id
      b_name.save
      @poll.babyname_ids << b_name.id
    end
    if @poll.save
      flash[:notice] = "Successfully created poll."
      redirect_to @poll
    else
      render :action => 'new'
    end
  end

  def vote_name

    pollid = params[:poll_id]
    nameid = params[:name_id]
    @poll = Poll.find(pollid)
    @name = Babyname.find(nameid)
#    @poll.increment(nameid, :num_votes => 1)
#    babyname = @poll.babynames.find(nameid)
    Babyname.increment(nameid, :num_votes => 1)
    redirect_to @poll
#    if poll.save
#      flash[:notice] = "Successfully voted."
#      redirect_to @poll
#    else
#      redirect_to @poll
#    end

  end
  
  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      flash[:notice] = "Successfully created poll."
      redirect_to @poll
    else
      render :action => 'new'
    end
  end
  
  def edit
    @poll = Poll.find(params[:id])
  end
  
  def update
    @poll = Poll.find(params[:id])
    if @poll.update_attributes(params[:poll])
      flash[:notice] = "Successfully updated poll."
      redirect_to @poll
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy
    flash[:notice] = "Successfully destroyed poll."
    redirect_to polls_url
  end
end
