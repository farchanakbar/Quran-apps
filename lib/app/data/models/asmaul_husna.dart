// To parse this JSON data, do
//
//     final asmaulHusna = asmaulHusnaFromJson(jsonString);

import 'dart:convert';

AsmaulHusna asmaulHusnaFromJson(String str) =>
    AsmaulHusna.fromJson(json.decode(str));

String asmaulHusnaToJson(AsmaulHusna data) => json.encode(data.toJson());

class AsmaulHusna {
  final int? urutan;
  final String? latin;
  final String? arab;
  final String? arti;

  AsmaulHusna({
    this.urutan,
    this.latin,
    this.arab,
    this.arti,
  });

  factory AsmaulHusna.fromJson(Map<String, dynamic> json) => AsmaulHusna(
        urutan: json["urutan"],
        latin: json["latin"],
        arab: json["arab"],
        arti: json["arti"],
      );

  Map<String, dynamic> toJson() => {
        "urutan": urutan,
        "latin": latin,
        "arab": arab,
        "arti": arti,
      };
}
