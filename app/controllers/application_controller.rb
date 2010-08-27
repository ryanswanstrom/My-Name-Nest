# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
#  before_filter :ensure_domain
#
#  TheDomain = 'mynamenest.com'
#
#  def ensure_domain
#    if Rails.env.production? && request.env['HTTP_HOST'] == 'www.mynamenest.com'
#      redirect_to 'http://mynamenest.com/'
#    end
#  end


  Website_name = 'my name nest'
  Website_url = 'mynamenest.com'
  def index
    @title = "let people vote on your top 5 baby names"
  end

  def rand_poll
    total = Poll.count()
    random = rand(total-1) + 1
    puts "poll is nil " + @poll.nil?.to_s
#    options = {}
#    conds = {}
#    options[:skip] = 2
#    options[:conditions] = conds
    polls = Poll.all
    @poll = polls[random]
    redirect_to @poll
  end

  def terms
    @title = 'Terms of Service'
  end


end
