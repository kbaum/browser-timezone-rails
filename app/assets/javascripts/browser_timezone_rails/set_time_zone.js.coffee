window.BrowserTZoneOptions ||= {
  initialReload: true
}

window.BrowserTZone ||= {}
BrowserTZone.setCookie = ->
  should_reload = ($.cookie("browser.timezone") == null and BrowserTZoneOptions.initialReload)
  $.cookie "browser.timezone", jstz.determine().name(), { expires: 365, path: '/' }
  location.reload() if should_reload

jQuery ->
  BrowserTZone.setCookie()
