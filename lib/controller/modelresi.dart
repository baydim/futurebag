// To parse this JSON data, do
//
//     final modelResi = modelResiFromMap(jsonString);

import 'dart:convert';

ModelResi modelResiFromMap(String str) => ModelResi.fromMap(json.decode(str));

String modelResiToMap(ModelResi data) => json.encode(data.toMap());

class ModelResi {
  ModelResi({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory ModelResi.fromMap(Map<String, dynamic> json) => ModelResi(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  Data({
    this.summary,
    this.detail,
    this.history,
  });

  Summary summary;
  Detail detail;
  List<History> history;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        summary: Summary.fromMap(json["summary"]),
        detail: Detail.fromMap(json["detail"]),
        history:
            List<History>.from(json["history"].map((x) => History.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "summary": summary.toMap(),
        "detail": detail.toMap(),
        "history": List<dynamic>.from(history.map((x) => x.toMap())),
      };
}

class Detail {
  Detail({
    this.origin,
    this.destination,
    this.shipper,
    this.receiver,
  });

  String origin;
  String destination;
  String shipper;
  String receiver;

  factory Detail.fromMap(Map<String, dynamic> json) => Detail(
        origin: json["origin"],
        destination: json["destination"],
        shipper: json["shipper"],
        receiver: json["receiver"],
      );

  Map<String, dynamic> toMap() => {
        "origin": origin,
        "destination": destination,
        "shipper": shipper,
        "receiver": receiver,
      };
}

class History {
  History({
    this.date,
    this.desc,
    this.location,
  });

  DateTime date;
  String desc;
  String location;

  factory History.fromMap(Map<String, dynamic> json) => History(
        date: DateTime.parse(json["date"]),
        desc: json["desc"],
        location: json["location"],
      );

  Map<String, dynamic> toMap() => {
        "date": date.toIso8601String(),
        "desc": desc,
        "location": location,
      };
}

class Summary {
  Summary({
    this.awb,
    this.courier,
    this.service,
    this.status,
    this.date,
    this.desc,
    this.amount,
    this.weight,
  });

  String awb;
  String courier;
  String service;
  String status;
  DateTime date;
  String desc;
  String amount;
  String weight;

  factory Summary.fromMap(Map<String, dynamic> json) => Summary(
        awb: json["awb"],
        courier: json["courier"],
        service: json["service"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
        desc: json["desc"],
        amount: json["amount"],
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "awb": awb,
        "courier": courier,
        "service": service,
        "status": status,
        "date": date.toIso8601String(),
        "desc": desc,
        "amount": amount,
        "weight": weight,
      };
}