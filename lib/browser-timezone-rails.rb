require "browser-timezone-rails/engine"

module BrowserTimezoneRails
  module TimezoneControllerSetup
    def self.included(base)
      base.send(:around_filter, :set_time_zone)
    end

    private

    def set_time_zone
      old_time_zone = Time.zone
      Time.zone = browser_timezone if browser_timezone.present?
      yield
    ensure
      Time.zone = old_time_zone
    end

    def browser_timezone
      cookies["browser.timezone"]
    end
  end

  class Railtie < Rails::Engine
    initializer "browser_timezone_rails.controller" do
      ActiveSupport.on_load(:action_controller) do
        include BrowserTimezoneRails::TimezoneControllerSetup
      end
    end
  end
end
