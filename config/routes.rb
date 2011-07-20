Rails.application.routes.draw do
  get "cache_wagon/flash_messages" => "cache_wagon/flash_messages#index"
end