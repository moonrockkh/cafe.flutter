
import 'dart:convert';

HttpCustomReponse httpCustomReponseFromJson(String str) => HttpCustomReponse.fromJson(json.decode(str));
String httpCustomReponseToJson(HttpCustomReponse data) => json.encode(data.toJson());

class HttpCustomReponse {
  int statusCode;
  dynamic data;
  String message;
  String messageI18n;

  HttpCustomReponse({
    this.statusCode,
    this.data,
    this.message,
    this.messageI18n,
  });

  factory HttpCustomReponse.fromJson(Map<String, dynamic> json) => HttpCustomReponse(
        statusCode: json["StatusCode"] == null ? null : json["StatusCode"],
        data: json["Data"],
        message: json["Message"] == null ? "" : json["Message"],
        messageI18n: json["MessageEn"] == null ? "" : json["MessageI18n"],
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode == null ? null : statusCode,
        "Data": data,
        "Message": message == null ? null : message,
        "MessageI18n": messageI18n == null ? null : messageI18n,
      };
}
