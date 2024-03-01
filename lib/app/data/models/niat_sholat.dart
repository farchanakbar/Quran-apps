// To parse this JSON data, do
//
//     final niatSholat = niatSholatFromJson(jsonString);

import 'dart:convert';

NiatSholat niatSholatFromJson(String str) =>
    NiatSholat.fromJson(json.decode(str));

String niatSholatToJson(NiatSholat data) => json.encode(data.toJson());

class NiatSholat {
  final int? number;
  final String? name;
  final String? arabic;
  final String? latin;
  final String? translation;

  NiatSholat({
    this.number,
    this.name,
    this.arabic,
    this.latin,
    this.translation,
  });

  factory NiatSholat.fromJson(Map<String, dynamic> json) => NiatSholat(
        number: json["number"],
        name: json["name"],
        arabic: json["arabic"],
        latin: json["latin"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "arabic": arabic,
        "latin": latin,
        "translation": translation,
      };
}
