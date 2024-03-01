// To parse this JSON data, do
//
//     final doaHarian = doaHarianFromJson(jsonString);

import 'dart:convert';

DoaHarian doaHarianFromJson(String str) => DoaHarian.fromJson(json.decode(str));

String doaHarianToJson(DoaHarian data) => json.encode(data.toJson());

class DoaHarian {
  final String? id;
  final String? doa;
  final String? ayat;
  final String? latin;
  final String? artinya;

  DoaHarian({
    this.id,
    this.doa,
    this.ayat,
    this.latin,
    this.artinya,
  });

  factory DoaHarian.fromJson(Map<String, dynamic> json) => DoaHarian(
        id: json["id"],
        doa: json["doa"],
        ayat: json["ayat"],
        latin: json["latin"],
        artinya: json["artinya"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doa": doa,
        "ayat": ayat,
        "latin": latin,
        "artinya": artinya,
      };
}
