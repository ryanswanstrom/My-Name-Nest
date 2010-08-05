class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end
  
  def show
    @title = "nest"
    @poll = Poll.find(params[:id])
    @boys = Array.new
    @girls = Array.new
    if @poll.babynames
      @poll.babynames.each do |thename|
        if thename.is_girl
          @girls << thename
        else
          @boys << thename
        end
      end
    end
    unless @poll.title.empty?
      @title = @poll.title
    end
  end
  
  def create
    @title = "try creating a nest again"
    @poll = Poll.new(params[:poll])
    if @poll.valid?
      @poll.save
      flash[:notice] = "Successfully created poll.<br/>" +
        "The following is the address to your unique list. <br/>" +
        "Copy and Paste this link to facebook, twitter, or email.<br/>" +
        "http://" + request.host + "/nest/" + @poll.id.to_s 
      redirect_to @poll
    else
      render :action => 'new'
    end
  end

  def vote_name
    Babyname.vote(params[:name_id])
    pollid = params[:poll_id]
    @poll = Poll.find(pollid)
    redirect_to @poll
  end

  def destroy
    #    Poll.destroy(params[:id])
    #    Poll.delete_all
    redirect_to polls_path
  end

  def edit
    redirect_to polls_path
  end

  def new
    @title = "create a new nest"
    @poll = Poll.new
    10.times{@poll.babynames.build}
  end

  
end
