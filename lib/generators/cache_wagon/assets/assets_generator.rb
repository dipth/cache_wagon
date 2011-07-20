# encoding: utf-8

module CacheWagon
  # Copies the necessary js-files to public/javascripts/
  #
  # @example
  #   $ rails generate cache_wagon:assets
  #
  # @todo Revisit in Rails 3.1 where public assets are treated differently
  class AssetsGenerator < Rails::Generators::Base
    desc "Copies the cache_wagon js-files to your apps public/javascripts/"

    source_root File.expand_path('../../../../../', __FILE__)

    def copy_files
      directory   'public/javascripts', 'public/javascripts'
    end
  end
end