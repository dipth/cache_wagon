require 'cache_wagon/helpers/view_helpers'

module CacheWagon
  
  class Railtie < Rails::Railtie
    
    initializer 'cache_wagon.helpers.view_helpers' do |app|
      ActionView::Base.send :include, ViewHelpers
    end
    
  end
  
end