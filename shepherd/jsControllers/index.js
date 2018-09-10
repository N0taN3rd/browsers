import $ from 'jquery'
import CBrowser from './browser'


$(function() {
  function on_countdown(seconds, countdown_text) {
    $("#countdown").text(countdown_text);
  }

  function on_event(type, data) {
    if (type == "fail" || type == "expire") {
      window.location.reload();
    }
  }

  var proxy_ws = undefined;

  if (!window.location.port) {
    proxy_ws = "_websockify?port=";
  }

  window.CBrowserInit.on_countdown = on_countdown;
  window.CBrowserInit.on_event = on_event;
  window.CBrowserInit.proxy_ws = proxy_ws;

  var cb = new CBrowser(window.reqid, "#browser", window.CBrowserInit);
});

