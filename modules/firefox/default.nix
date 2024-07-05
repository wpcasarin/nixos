{ firefox-extensions, username, ... }:

{
  home.file."chrome" = {
    source = ./chrome;
    target = ".mozilla/firefox/${username}/chrome";
    recursive = true;
  };
  programs.firefox = {
    enable = true;
    profiles.${username} = {
      isDefault = true;
      # userChrome = builtins.readFile ./userChrome-Monterey.css;
      # userContent = builtins.readFile ./userContent-Monterey.css;
      search = {
        force = true;
        default = "DuckDuckGo";
        privateDefault = "DuckDuckGo";
        engines = {
          "Bing".metaData.hidden = true;
          "Google".metaData.hidden = true;
          "Wikipedia (en)".metaData.hidden = true;
        };
      };
      # extensions = with firefox-extensions; [
      #   bitwarden
      #   ublock-origin
      #   darkreader
      #   skip-redirect
      # ];
      # https://github.com/arkenfox/user.js/blob/master/user.js
      settings = {
        # Extra
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.inTitlebar" = 0;
        "places.history.enabled" = false;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
        # 0000: disable about:config warning
        "browser.aboutConfig.showWarning" = false;
        # [SECTION 0100]: STARTUP
        "browser.startup.page" = 0;
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "browser.newtabpage.enabled" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";
        # [SECTION 0200]: GEOLOCATION
        "geo.provider.use_geoclue" = false;
        # [SECTION 0300]: QUIETER FOX 
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.discovery.enabled" = false;
        "browser.shopping.experience2023.enabled" = false;
        # TELEMETRY
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.serve" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = false;
        "toolkit.coverage.opt-out" = false;
        "toolkit.coverage.endpoint.base" = "";
        "browser.ping-centre.telemetry" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        # STUDIES
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";
        # CRASH REPORTS
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.enabled" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
        # OTHER
        "aptivedetect.canonicalURL" = "";
        "network.captive-portal-service.enabled" = "";
        "network.connectivity-service.enabled" = "";
        # [SECTION 0400]: SAFE BROWSING (SB)
        "browser.safebrowsing.malware.enabled" = false;
        "browser.safebrowsing.phishing.enabled" = false;
        "browser.safebrowsing.downloads.enabled" = false;
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "browser.safebrowsing.downloads.remote.url" = "";
        "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
        "browser.safebrowsing.downloads.remote.block_uncommon" = false;
        "browser.safebrowsing.allowOverride" = false;
        # [SECTION 0600]: BLOCK IMPLICIT OUTBOUND
        "network.prefetch-next" = false;
        "network.dns.disablePrefetch" = true;
        "network.predictor.enabled" = false;
        "network.predictor.enable-prefetch" = false;
        "network.http.speculative-parallel-limit" = 0;
        "browser.places.speculativeConnect.enabled" = false;
        "browser.send_pings" = false;
        # [SECTION 0700]: DNS / DoH / PROXY / SOCKS
        "network.proxy.socks_remote_dns" = true;
        "network.file.disable_unc_paths" = true;
        "network.gio.supported-protocols" = "";
        # [SECTION 0800]: LOCATION BAR / SEARCH BAR / SUGGESTIONS / HISTORY / FORMS 
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.trending.featureGate" = false;
        "browser.urlbar.addons.featureGate" = false;
        "browser.urlbar.mdn.featureGate" = false;
        "browser.urlbar.pocket.featureGate" = false;
        "browser.urlbar.weather.featureGate" = false;
        "browser.urlbar.clipboard.featureGate" = false;
        "browser.formfill.enable" = false;
        "browser.search.separatePrivateDefault" = true;
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        # [SECTION 0900]: PASSWORDS
        "signon.autofillForms" = false;
        "signon.rememberSignons" = false;
        "signon.management.page.breach-alerts.enabled" = false;
        "signon.formlessCapture.enabled" = false;
        "network.auth.subresource-http-auth-allow" = 1;
        # [SECTION 1000]: DISK AVOIDANCE
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "media.memory_cache_max_size" = 65536;
        "browser.sessionstore.privacy_level" = 2;
        # [SECTION 1200]: HTTPS (SSL/TLS / OCSP / CERTS / HPKP)
        "security.ssl.require_safe_negotiation" = true;
        "security.tls.enable_0rtt_data" = false;
        "security.OCSP.enabled" = 1;
        "security.OCSP.require" = true;
        "security.cert_pinning.enforcement_level" = 2;
        "security.remote_settings.crlite_filters.enabled" = true;
        "security.pki.crlite_mode" = 2;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_send_http_background_request" = false;
        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;
        # [SECTION 1600]: REFERERS
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        # [SECTION 2000]: PLUGINS / MEDIA / WEBRTC
        "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
        "media.peerconnection.ice.default_address_only" = true;
        # [SECTION 2400]: DOM (DOCUMENT OBJECT MODEL)
        "dom.disable_window_move_resize" = true;
        # [SECTION 2600]: MISCELLANEOUS
        "browser.uitour.enabled" = false;
        "browser.uitour.url" = "";
        "permissions.default.shortcuts" = 2;
        "permissions.manager.defaultsUrl" = "";
        "webchannel.allowObject.urlWhitelist" = "";
        "network.IDN_show_punycode" = true;
        "pdfjs.disabled" = true;
        "pdfjs.enableScripting" = false;
        "browser.tabs.searchclipboardfor.middleclick" = false;
        "browser.download.useDownloadDir" = false;
        "browser.download.alwaysOpenPanel" = false;
        "browser.download.manager.addToRecentDocs" = false;
        "browser.download.always_ask_before_handling_new_types" = true;
        # [SECTION 2700]: ETP (ENHANCED TRACKING PROTECTION) 
        "browser.contentblocking.category" = "strict";
        # [SECTION 4000]: FPP (fingerprintingProtection)
        "privacy.fingerprintingProtection.pbmode" = true;
        #  [SECTION 5000]: OPTIONAL OPSEC
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.bookmark" = true;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.topsites" = false;
        # [SECTION 9000]: NON-PROJECT RELATED 
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSearch" = false;
        "browser.messaging-system.whatsNewPanel.enabled" = false;
        "browser.urlbar.showSearchTerms.enabled" = false;
      };
    };
  };
}
