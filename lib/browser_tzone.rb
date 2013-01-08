require "browser_tzone/engine"

module BrowserTzone
  class Railtie < Rails::Railtie
    initializer 'browser_tzone.initialize' do |app|

      ::ApplicationController.class_eval do

        around_filter :set_time_zone

        private

        def set_time_zone
          old_time_zone = Time.zone
          Time.zone = browser_timezone if browser_timezone.present?
          yield
        ensure
          Time.zone = old_time_zone
        end

        def browser_timezone
          cookies["browser.timezone"].tap{ |tz| logger.debug "detected timezone #{tz}" }
        end


      end

    end
  end
end
