(function() {
  Cookies.set("browser.timezone", jstz.determine().name(), { expires: 365, path: '/' });
})();

