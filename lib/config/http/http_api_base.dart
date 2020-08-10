/*
 * 
 */
abstract class HttpApiBase {
  bool isProduction = false;

  HttpApiBase(this.isProduction);
  
  Map<String, dynamic> getConfigPreference() {
    if (isProduction) {
      return getProductionConfigPreference();
    } else {
      return getDevelopmentConfigPreference();
    }
  }

  Map<String, dynamic> getProductionConfigPreference();
  Map<String, dynamic> getDevelopmentConfigPreference();
  String getExtractPrefixCode(String code);
}
