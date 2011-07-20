require 'cache_wagon/controllers/base'
  
class CacheWagon::FlashMessagesController < ActionController::Base
  include CacheWagon::Controllers::Base
  
  def index
    @flash_messages = read_flash_from_session
    render :content_type => 'text/javascript'
  end
end