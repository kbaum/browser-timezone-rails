# browser_tzone

Rails Engine which sets the Rails timezone to the browser's configured timezone for each request. 

## Installation

Add it to your Gemfile.

```ruby
gem 'browser_tzone'
```

Require the javascript file.
```
//= require browser_tzone/application.js
```

## How it works

The browsers timezone is set in a cookie using the awesome [jsTimezoneDetect](https://bitbucket.org/pellepim/jstimezonedetect) javascript library.  That cookie is then read during each request to set the Rails timezone for that user.

### About that cookie
The cookie is set each full page request and lives for 365 days

### Caveat
The first request ever made by a user's browser to your app will not set the browser's time zone as the javascript that sets the cookie has not yet run on their browser.  This will only happen once and for me it was not a problem.  

This project rocks and uses MIT-LICENSE.
