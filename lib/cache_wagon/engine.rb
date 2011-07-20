module CacheWagon
  
  class Engine < Rails::Engine
    
    initializer "cache_wagon.load_static_assets" do |app|
      app.middleware.insert_after(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
    end
    
  end
  
end