require "browser-timezone-rails/engine"
require 'js_cookie_rails'
require 'jstz-rails'

module BrowserTimezoneRails
  if Rails::VERSION::MAJOR == 3 || (Rails::VERSION::MAJOR == 4 && Rails::VERSION::MINOR >= 2)
    PREPEND_METHOD = :prepend_around_filter
  else
    PREPEND_METHOD = :prepend_around_action
  end

  module TimezoneControllerSetup
    def self.included(base)
      base.send(PREPEND_METHOD, :set_time_zone)
    end

    private

    def set_time_zone(&action)
      # Use existing methods to simplify filter
      Time.use_zone(Time.find_zone(browser_timezone.presence) || Time.zone, &action)
    end

    def browser_timezone
      cookies["browser.timezone"]
    end
  end

  class Railtie < Rails::Engine
    initializer "browser_timezone_rails.controller" do
      ActiveSupport.on_load(:action_controller) do
        if self == ActionController::Base
          include BrowserTimezoneRails::TimezoneControllerSetup
        end
      end
    end
  end
end
