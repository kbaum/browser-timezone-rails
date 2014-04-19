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

## How it works

The browsers timezone is set in a cookie using the awesome [jsTimezoneDetect](https://bitbucket.org/pellepim/jstimezonedetect) javascript library.  That cookie is then read during each request to set the Rails timezone for that user.

### About that cookie
The cookie is set each full page request and lives for 365 days

### Thread safety
Yes.  It uses the Rails Time.zone method which is thread safe.

### Initial Reload
By default, the first time user opens the page, the cookie will not be set, so the times will be wrong, but after second page load server will read the cookie and all times will be displayed in the detected timezone.

If you want the page to reload itself after first visit, without user even noticing, you can enable initial reload by overriding options of the __BrowserTZone__:
```ruby
# app/assets/javascripts/application.js.coffee
//= require browser_timezone_rails/application

# Overriding options
window.BrowserTZoneOptions['initialReload'] = true # This will enable initial reload
```

### Development
To run the tests, invoke `bundle exec rspec`.
