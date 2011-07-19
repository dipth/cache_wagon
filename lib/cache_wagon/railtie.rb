require 'cache_wagon/helpers/view_helpers'
require 'cache_wagon/controllers/base'

module CacheWagon
  
  class Railtie < Rails::Railtie
    
    initializer 'cache_wagon.helpers.view_helpers' do |app|
      ActionView::Base.send :include, Helpers::ViewHelpers
    end
    
    initializer 'cache_wagon.controllers.base' do |app|
      ActionController::Base.send :include, Controllers::Base
    end
    
    config.before_configuration do
      # Add date.js and cache_wagon.js to the default list of javascripts
      config.action_view.javascript_expansions[:defaults] << %w(date cache_wagon)
    end
    
  end
  
end