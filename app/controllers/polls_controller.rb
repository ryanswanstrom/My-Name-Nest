class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end
  
  def show
    @poll = Poll.find(params[:id])
    @boys = Array.new
    @girls = Array.new
    @poll.babynames.each do |thename|
      if thename.is_girl
        @girls << thename
      else
        @boys << thename
      end
    end
  end
  
  def create
    @poll = Poll.create(params[:poll])
    (1..10).each do |i|
      babyname = params["name_".concat(i.to_s)]
      unless babyname.empty?
        is_girl = true
        if i < 6
          is_girl = false
        end
        @poll.add_babyname(babyname ,is_girl)
      end
    end
    if @poll.save
      flash[:notice] = "Successfully created poll.<br/>" +
        "The following is the address to your unique list. " +
        "Copy and Past this link to facebook, twitter, or email.<br/>" +
        "http://" + request.host + "/polls/" + @poll.id.to_s
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
   
end
