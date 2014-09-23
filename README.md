# BrowserTimezoneRails

[![Build Status](https://secure.travis-ci.org/kbaum/browser-timezone-rails.png)](http://travis-ci.org/kbaum/browser-timezone-rails)
[![Code Quality](https://codeclimate.com/badge.png)](https://codeclimate.com/github/kbaum/browser-timezone-rails)

Rails Engine which sets the Rails timezone to the browser's configured timezone for each request.

## Installation

Add it to your Gemfile.

```ruby
gem 'browser-timezone-rails'
```

Require the javascript file.
```
//= require browser_timezone_rails/application.js
```

## Controller config
After installation, you'll need to configure your controller to set the time zone from the gem by saving a cookie to the user's broswer with the timezone. The around_filter is used so that it will not leak to other requests. This will also make sure that the timezone gets reset when the session ends.
```
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
  cookies["browser.timezone"]
end
```
## How it works

The browsers timezone is set in a cookie using the awesome [jsTimezoneDetect](https://bitbucket.org/pellepim/jstimezonedetect) javascript library.  That cookie is then read during each request to set the Rails timezone for that user.

For those of you who need or want to do this on the backend with just Rails, Ryan Bates has a good RailsCast on how to that: [RailsCast #106](http://railscasts.com/episodes/106-time-zones-revised)

You can also read more about this implementation here: [Blog](http://cowjumpedoverthecommodore64.blogspot.in/2013/03/setting-rails-timezone-to-users.html)

### About that cookie
The cookie is set each full page request and lives for 365 days

### Thread safety
Yes.  It uses the Rails Time.zone method which is thread safe.

### Caveat
The first request ever made by a user's browser to your app will not set the browser's time zone as the javascript that sets the cookie has not yet run on their browser.  This will only happen once and for me it was not a problem.

### Development
To run the tests, invoke `bundle exec rspec`.
