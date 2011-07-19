module CacheWagon
  module Controllers
    module Base
      
      def self.included(base)
        base.helper_method :read_flash_from_session
      end
      
      def write_flash_to_session
        flash.each do |key, value|
          session["flash_keys"] = ""
          if value.present?
            session["flash_#{key}"] = value
            session["flash_keys"] << ",#{key}"
          end
          session["flash_keys"] = session["flash_keys"].gsub(/^,/, '')
        end
        flash.clear
      end
      
      def read_flash_from_session
        result = {}
        unless session["flash_keys"].blank?
          session["flash_keys"].split(',').each do |key|
            unless session["flash_#{key}"].blank?
              value = session["flash_#{key}"]
              result[key] = value
              session["flash_#{key}"] = nil
            end
          end
          session["flash_keys"] = nil
        end
        result
      end
      
    end
  end
end