jQuery ->
  $.cookie "browser.timezone", jstz.determine().name()
