class PollsController < ApplicationController
  def index
    @polls = Poll.sort(:created_at.desc).all
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
    empty_names = 'At least one baby name must be entered.'
    if @poll.babynames.empty?
      @poll.errors.add_to_base(empty_names)
    else
      all_empty = true
      @poll.babynames.each do |babyname|
        if !babyname.name.strip.empty?
          all_empty = false
          break
        end
      end
      if all_empty
        @poll.errors.add_to_base(empty_names)
      end
    end
    if @poll.errors.empty? && @poll.valid?
      @poll.save
      flash[:notice] = 
        "The following is the address to your unique nest. <br/>" +
        "Copy and Paste this link to facebook, twitter, or email.<br/>" +
        "<strong>" +
        "http://" + request.host + "/nest/" + @poll.id.to_s  + "</strong>"
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

#  def destroy
#    #    Poll.destroy(params[:id])
#    #    Poll.delete_all
#    redirect_to polls_path
#  end

#  def edit
#    redirect_to polls_path
#  end

  def new
    @title = "create a new nest"
    @poll = Poll.new
    10.times{@poll.babynames.build}
    @poll.errors.clear
  end
  
end
