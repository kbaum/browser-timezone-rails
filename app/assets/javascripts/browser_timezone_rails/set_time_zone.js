"use strict";

(function() {
  var COOKIE_NAME = "browser.timezone";
  var COOKIE_OPTS = { expires: 365, path: "/" };

  function getTimeZoneName() {
    try {
      return Intl.DateTimeFormat().resolvedOptions().timeZone;
    }
    catch (_err) {
      return jstz.determine().name();
    }
  }

  function setCookie() {
    var cookie = { timezone: getTimeZoneName() };
    var existingCookie = readCookie();
    if !(existingCookie.override === undefined) {
      return false;
    }
    if (existingCookie.timezone != cookie.timezone) {
      var event = new CustomEvent("setTimeZoneCookie", { detail: cookie });
      Cookies.set(COOKIE_NAME, JSON.stringify(cookie), COOKIE_OPTS);
      document.addEventListener("DOMContentLoaded", function() {
        document.dispatchEvent(event);
      }, false);
    }
  }

  function readCookie() {
    try {
      return JSON.parse(Cookies.get(COOKIE_NAME));
    }
    catch (e) {
      return({});
    }
  }

  setCookie();
})();

