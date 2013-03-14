window.BrowserTZone ||= {}
BrowserTZone.setCookie = ->
  $.cookie "browser.timezone", jstz.determine().name(), { expires: 365, path: '/' }

jQuery ->
  BrowserTZone.setCookie()
