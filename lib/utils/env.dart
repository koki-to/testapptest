enum Environment { DEVELOP, STAGING, PRODUCTION }

class Constants {
  // static Map<String, dynamic> _config;
  static Map<String, dynamic> _apiConfig;
  // // static Map<String, dynamic> _verConfig;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEVELOP:
        // _config = _Config.debugConstants;
        _apiConfig = _Config.debugConstants;
        // _verConfig = _Config.debugConstants;
        break;
      case Environment.STAGING:
        // _config = _Config.stagingConstants;
        _apiConfig = _Config.stagingConstants;
        break;
      case Environment.PRODUCTION:
        // _config = _Config.productionConstants;
        _apiConfig = _Config.productionConstants;
        break;
    }
  }

  // static get serverUrl => _config[_Config.SERVER];
  static get apiKey => _apiConfig[_Config.APIKEY];
  // static get verCtrl => _verConfig[_Config.VERCTRL];
  // static get suffixUrl => _config[_Config.SUFFIX];
}

class _Config {
  // static const SERVER = "Server";
  static const APIKEY = "x-api-key";
  // static const VERCTRL = "x-app-version";
  // static const SUFFIX = "Suffix";

  static Map<String, dynamic> debugConstants = {
    // SERVER: "https://dev.app.grd.ichain.co.jp",
    APIKEY: "UgLr%80Q\$gYu4",
    // VERCTRL: Utility.appVersion,
  };

  static Map<String, dynamic> stagingConstants = {
    // SERVER: "https://dev.app.grd.ichain.co.jp",
    APIKEY: "stg%80Q\$gYu4",
    // SUFFIX: "api/",
  };

  static Map<String, dynamic> productionConstants = {
    // SERVER: "https://app.grd.ichain.co.jp",
    APIKEY: "j#Akvx17hn!iz"
  };
}
