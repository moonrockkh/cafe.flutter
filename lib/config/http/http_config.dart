import 'package:cafeshop/helper/token_helper.dart';
import 'package:flutter/material.dart';

import 'http_api_base.dart';

class HttpConfig {
  static Map<String, String> headers = {'Content-Type': 'application/x-www-form-urlencoded', 'Cache-Control': 'no-cache'};

  static const String HTTP_PREFIX_KEY = "HTTP_PREFIX";
  static const String URL_PREFIX_API_KEY = "URL_PREFIX_API";
  static const String URL_SUFFIX_API_KEY = "URL_SUFFIX_API";
  static const String API_SECRED_KEY = "API_SECRED";
  static const String ENABLE_CODE_EXTRACTOR = "ENABLE_CODE_EXTRACTOR";
  static const String URL_WIKI_CLASSROM = "URL_WIKI_CLASSROM";
  static const String URL_WIKI_CLASSROM_KEY = "URL_WIKI_CLASSROM_KEY";

  HttpApiBase httpApiBase;
  Map<String, dynamic> configPreference;

  HttpConfig._(this.httpApiBase) {
    this.configPreference = httpApiBase.getConfigPreference();
  }

  static HttpConfig _instance;

  static HttpConfig getInstance() {
    return _instance;
  }

  static void init(HttpApiBase httpApiBase) {
    _instance = HttpConfig._(httpApiBase);
  }

  String getBaseApiClientUrl() {
    String baseUrl = TokenHelper.getInstance().getBaseUrl();
    if (baseUrl == null || baseUrl == '') {
      return null;
    }
    return baseUrl + "/api";
  }

  String getApiSecredKey() {
    return configPreference[API_SECRED_KEY];
  }

  String getPrefixCode(String fullText) {
    String prefixCode = "";
    bool enableCodeExtract = configPreference.containsKey(HttpConfig.ENABLE_CODE_EXTRACTOR) && configPreference[HttpConfig.ENABLE_CODE_EXTRACTOR];
    if (enableCodeExtract) {
      prefixCode = httpApiBase.getExtractPrefixCode(fullText);
    }
    return prefixCode;
  }

  void saveBaseApiClientUrl({@required String fullText}) {
    String baseURl = configPreference[HTTP_PREFIX_KEY];

    if (configPreference[URL_PREFIX_API_KEY] != null && configPreference[URL_PREFIX_API_KEY] != "") {
      baseURl += configPreference[URL_PREFIX_API_KEY];
    }

    bool enableCodeExtract = configPreference.containsKey(HttpConfig.ENABLE_CODE_EXTRACTOR) && configPreference[HttpConfig.ENABLE_CODE_EXTRACTOR];
    if (enableCodeExtract) {
      String prefixCode = httpApiBase.getExtractPrefixCode(fullText);
      if (prefixCode != null && prefixCode != "") {
        baseURl += prefixCode;
      }
    }

    if (configPreference[URL_SUFFIX_API_KEY] != null && configPreference[URL_SUFFIX_API_KEY] != "") {
      baseURl += "." + configPreference[URL_SUFFIX_API_KEY];
    }
    TokenHelper.getInstance().setBaseURl(baseURl);
  }
}
