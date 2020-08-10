import 'package:cafeshop/config/auth/auth_token.dart';
import 'package:cafeshop/constant/app_const.dart';
import 'package:cafeshop/helper/date_helper.dart';
import 'package:cafeshop/scoped_model/app_scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenHelper {
  SharedPreferences pref;

  static const String BASE_URL = "app_base_url";

  static const String ACCESS_TOKEN = "access_token";
  static const String TOKEN_TYPE = "token_type";
  static const String REFRESH_TOKEN = "refresh_token";
  static const String EXPIRES_IN = "expires_in";
  static const String EXPIRES_DATE = "expires_date";
  static const String REMEMBER_ME = "remember_me";
  static const String LOADED_INTRO = "loaded_intro";
  static const String TOPIC_SUBCRIPTION = "topic_subcription";
  static const String WIKI_USER_KEY = "wiki_user_key";

  static const String IS_GUEST_ACCOUNT = "guest_account";
  static const String CLASS_ROUTINE_TOPICS_SUBCRIPTION = "class_routine_topics_subcription";

  TokenHelper._(this.pref);

  static TokenHelper _instance;
  static TokenHelper getInstance() {
    return _instance;
  }

  static void init(SharedPreferences pref) {
    _instance = TokenHelper._(pref);
  }

  bool isAuth() {
    return getAccessToken() != null;
  }

  void saveToken(AuthToken token) async {
    await pref.setString(ACCESS_TOKEN, token.accessToken);
    await pref.setString(TOKEN_TYPE, token.tokenType);
    await pref.setString(REFRESH_TOKEN, token.refreshToken);
    await pref.setInt(EXPIRES_IN, token.expiresIn);

    DateTime expireDate = DateHelper.getDatePlusSecond(DateTime.now(), token.expiresIn);
    String formateDate = DateHelper.format(expireDate, DateHelper.timeFormatddMMyyyHHMMA);
    await pref.setString(EXPIRES_DATE, formateDate);
  }

  Future<void> clear() async {
    await pref.remove(ACCESS_TOKEN);
    await pref.remove(TOKEN_TYPE);
    await pref.remove(REFRESH_TOKEN);
    await pref.remove(EXPIRES_IN);
    await pref.remove(EXPIRES_DATE);
    await pref.remove(BASE_URL);

    await pref.remove(IS_GUEST_ACCOUNT);
    await pref.remove(REMEMBER_ME);

    await pref.remove(WIKI_USER_KEY);

    await pref.remove(TOPIC_SUBCRIPTION);
    await pref.remove(AppScopedModel.APP_THEME_KEY);
  }

  String getKey(String key) {
    String value = pref.getString(key) ?? null;
    print("TokenHelper[" + key + "]:" + (value != null ? value : ''));
    return value;
  }

  void addKey(String key, String value) async {
    await pref.setString(key, value);
  }

  void removeKey(String key) async {
    await pref.remove(key);
  }

  String getBaseUrl() {
    String value = pref.getString(BASE_URL) ?? null;
    //print("TokenHelper[" + BASE_URL + "]:" + (value != null ? value : ''));
    return value;
  }

  void setBaseURl(String url) async {
    await pref.setString(BASE_URL, url);
  }

  String getAccessToken() {
    String value = pref.getString(ACCESS_TOKEN) ?? null;
    //print("TokenHelper[" + ACCESS_TOKEN + "]:" + (value != null ? value : ''));
    return value;
  }

  String getRefreshToken() {
    String value = pref.getString(REFRESH_TOKEN) ?? null;
    //print("TokenHelper[" + REFRESH_TOKEN + "]:" + (value != null ? value : ''));
    return value;
  }

  void setAccessToken(String data) async {
    await pref.setString(ACCESS_TOKEN, data);
  }

  void setRefreshToken(String data) async {
    await pref.setString(REFRESH_TOKEN, data);
  }

  bool getRememberMe() {
    bool value = pref.getBool(REMEMBER_ME) ?? false;
    print("TokenHelper[" + REMEMBER_ME + "]:" + (value ? 'true' : 'false'));
    return value;
  }

  void setRememberMe(bool rememberMe) async {
    await pref.setBool(REMEMBER_ME, rememberMe ?? false);
  }

  bool getLoadedIntro() {
    if (!AppConst.APP_ENABLE_INTRO) {
      return true;
    }
    bool value = pref.getBool(LOADED_INTRO) ?? false;
    print("TokenHelper[" + LOADED_INTRO + "]:" + (value ? 'true' : 'false'));
    return value;
  }

  void setLoadedIntro(bool loadedIntro) async {
    await pref.setBool(LOADED_INTRO, loadedIntro ?? false);
  }

  String getTopicSubscription() {
    String value = pref.getString(TOPIC_SUBCRIPTION) ?? null;
    print("TokenHelper[" + TOPIC_SUBCRIPTION + "]:" + (value != null ? value : ''));
    return value;
  }

  void setTopicSubscription(String topic) async {
    await pref.setString(TOPIC_SUBCRIPTION, topic);
  }

  bool isTokenExpire() {
    String expireDateStr = pref.getString(EXPIRES_DATE);
    if (expireDateStr == null || expireDateStr == '') {
      return true;
    }
    DateTime expireDate = DateHelper.getDate(expireDateStr, DateHelper.timeFormatddMMyyyHHMMA);
    DateTime currentDate = DateTime.now();

    if (AppConst.APP_PRODUCTION_MODE) {
      int nbDate = expireDate.difference(currentDate).inDays;
      print("Token Expire in $nbDate days.");
      return nbDate <= 1;
    } else {
      int inMinutes = expireDate.difference(currentDate).inMinutes;
      print("Token Expire in $inMinutes minutes.");
      return inMinutes <= 2;
    }
  }

  bool getIsGuestAccount() {
    bool value = pref.getBool(IS_GUEST_ACCOUNT) ?? false;
    print("TokenHelper[" + IS_GUEST_ACCOUNT + "]:" + (value ? 'true' : 'false'));
    return value;
  }

  /// News
  void setIsGuestAccount(bool isGuestAccount) async {
    await pref.setBool(IS_GUEST_ACCOUNT, isGuestAccount ?? false);
  }
}
