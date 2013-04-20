Cu.import("resource://gre/modules/XPCOMUtils.jsm");

var myObserver = {
  QueryInterface: XPCOMUtils.generateQI([Ci.nsIObserver,
                                         Ci.nsISupportsWeakReference]),
  observe: function(subject, topic, data) {
    if (topic == "content-document-global-created" &&
        subject instanceof Ci.nsIDOMWindow) {
      XPCNativeWrapper.unwrap(subject).wave_viewIcons=wave_viewIcons;
    }
  }
};

var observerService = Cc["@mozilla.org/observer-service;1"]
                        .getService(Ci.nsIObserverService);
observerService.addObserver(myObserver,
                            "content-document-global-created", true);
