module CacheWagon
  module Helpers
    module ViewHelpers
      # A cacheable version of ActionView::Helpers::DateHelper.time_ago_in_words
      # Instead of outputting a string of how long ago an event took place, this will output a span, with the date specified, as localized with the :short format.
      # The UTC-timestamp will be added as a HTML5 attribute to the span, along with the include_seconds option.
      # When the client-side javascript runs, it will replace the date, with a similar string of how long ago the event took place.
      #
      # Example: cacheable_time_ago_in_words(Time.zone.now - 2 minutes) # => <span class="time_ago_in_words" data-timestamp="Mon Jul 18 12:21:12 UTC 2011" data-include-seconds="false">18 Jul 14:21</span>
      # Which will be replaced by the client-side javascript with: <span class="time_ago_in_words" data-timestamp="Mon Jul 18 12:22:11 UTC 2011" data-include-seconds="false">2 minutes ago</span>
      def cacheable_time_ago_in_words(date_with_timezone, include_seconds = false)
     	  "<span class=\"time_ago_in_words\" data-timestamp=\"#{date_with_timezone.utc}\" data-include-seconds=\"#{include_seconds}\">#{I18n.l(date_with_timezone, :format => :short)}</span>".html_safe
      end
    end
  end
end