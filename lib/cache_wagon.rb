module CacheWagon
  if defined?(Rails)
    require 'cache_wagon/railtie'
    require 'cache_wagon/engine'
  end
end
