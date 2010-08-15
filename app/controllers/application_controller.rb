# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  Website_name = 'my name nest'
  Website_url = 'mynamenest.com'
  def index
    @title = "let people vote on your top 5 baby names"
  end

  def rand_poll
    total = Poll.count()
    puts "total is " + total.to_s
    random = rand(total-1) + 1
    puts "random is " + random.to_s
    options = {}
    conds = {}
    options[:skip] = random
    options[:conditions] = conds
    @poll = Poll.find(:first, {})
#    puts "poll id is " + @poll.id.to_s
    redirect_to @poll
  end

  def terms
    @title = 'Terms of Service'
  end


end
