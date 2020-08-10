
/*
 * HttpApi
 */
import 'package:cafeshop/config/http/http_api_base.dart';
import 'package:cafeshop/config/http/http_config.dart';

class HttpApi extends HttpApiBase {

  static const String API_SCHOOL_URL = "/public/api/school";

  static const String API_OAUTH = "/token";
  static const String API_ACCOUNT_ME = "/user/me";
  static const String API_CHANGE_PASSWORD = "/user/password/change";
  static const String API_SET_PASSWORD = "/user/set-password";

  HttpApi(bool isProduction) : super(isProduction);

  @override
  Map<String, dynamic> getDevelopmentConfigPreference() {
    return {
      HttpConfig.HTTP_PREFIX_KEY: "https://",
      HttpConfig.URL_PREFIX_API_KEY: "api-pri-beta",
      HttpConfig.URL_SUFFIX_API_KEY: "wikischool.asia",
      // HttpConfig.HTTP_PREFIX_KEY: "http://",
      // HttpConfig.URL_PREFIX_API_KEY: "192.168.10.185:8001",  // sovana
      // // HttpConfig.URL_PREFIX_API_KEY: "192.168.10.25:6677",  // Kong
      // HttpConfig.URL_SUFFIX_API_KEY: "",
      HttpConfig.API_SECRED_KEY: "Basic QW5kcm9pZEFwcDpheXJZY3NuZTJOODdaRHJFeVBRcDdGRWVZNlRFUFk=",
      HttpConfig.ENABLE_CODE_EXTRACTOR: false,
      HttpConfig.URL_WIKI_CLASSROM : "https://classroom.wikischool.asia",
      HttpConfig.URL_WIKI_CLASSROM_KEY : "CwUyIZjGZLaBI5Qe3ZkMk7W36QCMyuuFpAyquxk28PfXiOy3R1qG7fO1IILx"
    };
  }

  @override
  Map<String, dynamic> getProductionConfigPreference() {
     return {
      HttpConfig.HTTP_PREFIX_KEY: "https://",
      HttpConfig.URL_PREFIX_API_KEY: "api",
      HttpConfig.URL_SUFFIX_API_KEY: "wikischool.asia",
      HttpConfig.API_SECRED_KEY: "Basic QW5kcm9pZEFwcDpheXJZY3NuZTJOODdaRHJFeVBRcDdGRWVZNlRFUFk=",
      HttpConfig.ENABLE_CODE_EXTRACTOR: true,
      HttpConfig.URL_WIKI_CLASSROM : "https://classroom.wikischool.asia",
      HttpConfig.URL_WIKI_CLASSROM_KEY : "CwUyIZjGZLaBI5Qe3ZkMk7W36QCMyuuFpAyquxk28PfXiOy3R1qG7fO1IILx"
    };
  }

  @override
  String getExtractPrefixCode(String source) { 
   if (source == null || source == '' || source.length <= 3) {
      return '';
    }
    return source.substring(0, 3);
  }

}
