# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :ensure_domain

  def ensure_domain
    if Rails.env.production?

      # this code will forward all www.mynamenest.com to mynamenest.com
      host = request.host.gsub(/www./,'')

      if /^www/.match(request.host)
        new_url = "#{request.protocol}#{host}#{request.request_uri}"
        redirect_to(new_url, :status => 301)
      end
    end
  end


  Website_name = 'my name nest'
  Website_url = 'mynamenest.com'
  def index
    @title = "let people vote on your top 5 baby names"
    @recent = Poll.sort(:last_updated).limit(6).all
  end

  def rand_poll
    total = Poll.count()
    random = rand(total-1) + 1
#    puts "poll is nil " + @poll.nil?.to_s
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
