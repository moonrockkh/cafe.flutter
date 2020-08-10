import 'dart:convert';
import 'dart:ui';

import 'package:cafeshop/config/http/http_api_service.dart';
import 'package:cafeshop/constant/app_const.dart';
import 'package:cafeshop/helper/date_helper.dart';
import 'package:cafeshop/model/user/user_model.dart';
import 'package:cafeshop/service/firebase/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import 'firebase_const.dart';

abstract class FirebaseContentModel {
  bool isProductionMode;
  Map<String, dynamic> toJson();
}

class FirebaseUserModel extends FirebaseContentModel {
  String id;
  String name;
  String nameEn;
  String gender;
  String gateway;
  String deviceToken;
  String chattingWith;
  bool isActive;
  String avatar;
  Color color;
  Color containerColor;
  String lastLoginDate;

  FirebaseUserModel({this.id, this.name, this.nameEn, this.gender, this.gateway, this.deviceToken, this.chattingWith, this.isActive, this.color, this.containerColor, this.avatar, this.lastLoginDate});

  factory FirebaseUserModel.fromJson(Map<String, dynamic> json) => new FirebaseUserModel(
        id: json["id"] == null ? "" : json["id"],
        name: json["name"] == null ? "" : json["name"],
        nameEn: json["nameEn"] == null ? "" : json["nameEn"],
        gender: json["gender"] == null ? "" : json["gender"],
        avatar: json['avatar'],
        gateway: json["gateway"] == null ? "" : json["gateway"],
        deviceToken: json["deviceToken"] == null ? "" : json["deviceToken"],
        chattingWith: json["chattingWith"] == null ? "" : json["chattingWith"],
        isActive: json["isActive"] == null ? false : json["isActive"],
        containerColor: json['containerColor'] != null ? Color(json['containerColor']) : null,
        color: json['color'] != null ? Color(json['color']) : null,
        lastLoginDate: json['lastLoginDate'] != null ? json['lastLoginDate'] : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nameEn": nameEn,
        "gender": gender,
        "avatar": avatar,
        "gateway": gateway,
        "deviceToken": deviceToken,
        "chattingWith": chattingWith,
        "isActive": isActive,
        'containerColor': containerColor != null ? containerColor.value : null,
        'color': color != null ? color.value : null,
        'lastLoginDate': lastLoginDate != null ? lastLoginDate : null,
        'isProductionMode': AppConst.APP_PRODUCTION_MODE
      };
}

class FirebaseUserLoginHistory {
    FirebaseUserLoginHistory({
        this.userId,
        this.date,
        this.deviceName,
        this.devicePlatform,
        this.deviceToken,
        this.ipAddress,
        this.latitude,
        this.longitude,
    });

    String userId;
    String date;
    String deviceName;
    String devicePlatform;
    String deviceToken;
    String ipAddress;
    double latitude;
    double longitude;

    factory FirebaseUserLoginHistory.fromRawJson(String str) => FirebaseUserLoginHistory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FirebaseUserLoginHistory.fromJson(Map<String, dynamic> json) => FirebaseUserLoginHistory(
        userId: json["user_id"] == null ? null : json["user_id"],
        date: json["date"] == null ? null : json["date"],
        deviceName: json["device_name"] == null ? null : json["device_name"],
        devicePlatform: json["device_platform"] == null ? null : json["device_platform"],
        deviceToken: json["device_token"] == null ? null : json["device_token"],
        ipAddress: json["ip_address"] == null ? null : json["ip_address"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "date": date == null ? null : date,
        "device_name": deviceName == null ? null : deviceName,
        "device_platform": devicePlatform == null ? null : devicePlatform,
        "device_token": deviceToken == null ? null : deviceToken,
        "ip_address": ipAddress == null ? null : ipAddress,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
    };
}

/*
 * FirebaseCloudUserService
 */
class FirebaseCloudUserService {
  static Firestore fireStore = Firestore.instance;

  /*
   * 
   */
  static void updateActiveUser(UserModel userModel) async {
    FirebaseUserModel firebaseUserModel = FirebaseUserModel(
      id: userModel.id.toString(),
      name: userModel.username,
      gender: userModel.company?.toString(),
      isActive: true,
      deviceToken: await firebaseNotifications.getDeviceToken(),
      lastLoginDate: DateHelper.format(DateTime.now(), DateHelper.timeFormatddMMyyyHHMMSSA),
    );
    await fireStore.collection(USER_COLLECTION).document(userModel.id.toString()).setData(firebaseUserModel.toJson());
  }

  static void  updateUserLoginAddress(UserModel userModel) async {
    //String deviceIpAddress = await GetIp.ipAddress;
    Response<dynamic> response = await httpApiService.getDio().get("https://api.ipify.org?format=json");
    Map<String, dynamic> addressInfo = response.data;

    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    Position position = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    FirebaseUserLoginHistory loginHistory =  FirebaseUserLoginHistory(
      userId: userModel.id.toString(),
      date: DateHelper.format(DateTime.now(), DateHelper.timeFormatddMMyyyHHMMSSA),
      deviceName: firebaseNotifications.getDeviceName(),
      devicePlatform: firebaseNotifications.getDeviceTokenPlatform(),
      deviceToken: await firebaseNotifications.getDeviceToken(),
      ipAddress: addressInfo != null ? addressInfo['ip'] : null,
      latitude: position != null ? position.latitude : null,
      longitude: position != null ? position.longitude : null
    );
    await fireStore.collection(USER_LOGIN_HISTORY_COLLECTION).document(DateTime.now().millisecondsSinceEpoch.toString()).setData(loginHistory.toJson());
  }

  /*
   * 
   */
  static Future<void> deleteUserDocument(UserModel userModel) async {
    await fireStore.collection(USER_COLLECTION).document(userModel.id.toString()).delete();
  }

  /*
   * 
   */
  static Future<List<FirebaseUserModel>> getActiveUsers() async {
    print("Active Users");
    QuerySnapshot querySnapshot = await fireStore.collection(USER_COLLECTION).where("isActive", isEqualTo: true).getDocuments();
    List<DocumentSnapshot> documents = querySnapshot.documents;
    print("Documents ${documents.length}");
    if (documents.length > 0) {
      try {
        print("Active ${documents.length}");
        return documents.map((document) {
          FirebaseUserModel user = FirebaseUserModel.fromJson(Map<String, dynamic>.from(document.data));
          print("User ${user.name}");
          return user;
        }).toList();
      } catch (e) {
        print("Exception $e");
        return [];
      }
    }
    return [];
  }

  /*
   * 
   */
  static Future<bool> isUserActive(String id) async {
    QuerySnapshot querySnapshot = await fireStore.collection(USER_COLLECTION).where("id", isEqualTo: id).where("isActive", isEqualTo: true).getDocuments();
    List<DocumentSnapshot> documents = querySnapshot.documents;
    return documents.length > 0;
  }
}
