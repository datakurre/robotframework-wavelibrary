Cu.import("resource://gre/modules/XPCOMUtils.jsm");

var WAVEToolbarRobotObserver = {
    QueryInterface: XPCOMUtils.generateQI([Ci.nsIObserver,
        Ci.nsISupportsWeakReference]),
    observe: function(subject, topic, data) {
        if (topic == "content-document-global-created" &&
            subject instanceof Ci.nsIDOMWindow) {
            XPCNativeWrapper.unwrap(subject).wave_viewIcons=wave_viewIcons;
            XPCNativeWrapper.unwrap(subject).wave_viewReset=wave_viewReset;
        }
    }
};

var observerService = Cc["@mozilla.org/observer-service;1"]
    .getService(Ci.nsIObserverService);
observerService.addObserver(WAVEToolbarRobotObserver,
    "content-document-global-created", true);
