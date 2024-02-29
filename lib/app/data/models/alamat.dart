// To parse this JSON data, do
//
//     final alamat = alamatFromJson(jsonString);

import 'dart:convert';

Alamat alamatFromJson(String str) => Alamat.fromJson(json.decode(str));

String alamatToJson(Alamat data) => json.encode(data.toJson());

class Alamat {
  final double? latitude;
  final String? lookupSource;
  final double? longitude;
  final String? localityLanguageRequested;
  final String? continent;
  final String? continentCode;
  final String? countryName;
  final String? countryCode;
  final String? principalSubdivision;
  final String? principalSubdivisionCode;
  final String? city;
  final String? locality;
  final String? postcode;
  final String? plusCode;
  final Fips? fips;
  final LocalityInfo? localityInfo;

  Alamat({
    this.latitude,
    this.lookupSource,
    this.longitude,
    this.localityLanguageRequested,
    this.continent,
    this.continentCode,
    this.countryName,
    this.countryCode,
    this.principalSubdivision,
    this.principalSubdivisionCode,
    this.city,
    this.locality,
    this.postcode,
    this.plusCode,
    this.fips,
    this.localityInfo,
  });

  factory Alamat.fromJson(Map<String, dynamic> json) => Alamat(
        latitude: json["latitude"]?.toDouble(),
        lookupSource: json["lookupSource"],
        longitude: json["longitude"]?.toDouble(),
        localityLanguageRequested: json["localityLanguageRequested"],
        continent: json["continent"],
        continentCode: json["continentCode"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        principalSubdivision: json["principalSubdivision"],
        principalSubdivisionCode: json["principalSubdivisionCode"],
        city: json["city"],
        locality: json["locality"],
        postcode: json["postcode"],
        plusCode: json["plusCode"],
        fips: json["fips"] == null ? null : Fips.fromJson(json["fips"]),
        localityInfo: json["localityInfo"] == null
            ? null
            : LocalityInfo.fromJson(json["localityInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "lookupSource": lookupSource,
        "longitude": longitude,
        "localityLanguageRequested": localityLanguageRequested,
        "continent": continent,
        "continentCode": continentCode,
        "countryName": countryName,
        "countryCode": countryCode,
        "principalSubdivision": principalSubdivision,
        "principalSubdivisionCode": principalSubdivisionCode,
        "city": city,
        "locality": locality,
        "postcode": postcode,
        "plusCode": plusCode,
        "fips": fips?.toJson(),
        "localityInfo": localityInfo?.toJson(),
      };
}

class Fips {
  final String? state;
  final String? county;
  final String? countySubdivision;
  final String? place;

  Fips({
    this.state,
    this.county,
    this.countySubdivision,
    this.place,
  });

  factory Fips.fromJson(Map<String, dynamic> json) => Fips(
        state: json["state"],
        county: json["county"],
        countySubdivision: json["countySubdivision"],
        place: json["place"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "county": county,
        "countySubdivision": countySubdivision,
        "place": place,
      };
}

class LocalityInfo {
  final List<Ative>? administrative;
  final List<Ative>? informative;

  LocalityInfo({
    this.administrative,
    this.informative,
  });

  factory LocalityInfo.fromJson(Map<String, dynamic> json) => LocalityInfo(
        administrative: json["administrative"] == null
            ? []
            : List<Ative>.from(
                json["administrative"]!.map((x) => Ative.fromJson(x))),
        informative: json["informative"] == null
            ? []
            : List<Ative>.from(
                json["informative"]!.map((x) => Ative.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "administrative": administrative == null
            ? []
            : List<dynamic>.from(administrative!.map((x) => x.toJson())),
        "informative": informative == null
            ? []
            : List<dynamic>.from(informative!.map((x) => x.toJson())),
      };
}

class Ative {
  final String? name;
  final String? description;
  final String? isoName;
  final int? order;
  final int? adminLevel;
  final String? isoCode;
  final String? wikidataId;
  final int? geonameId;

  Ative({
    this.name,
    this.description,
    this.isoName,
    this.order,
    this.adminLevel,
    this.isoCode,
    this.wikidataId,
    this.geonameId,
  });

  factory Ative.fromJson(Map<String, dynamic> json) => Ative(
        name: json["name"],
        description: json["description"],
        isoName: json["isoName"],
        order: json["order"],
        adminLevel: json["adminLevel"],
        isoCode: json["isoCode"],
        wikidataId: json["wikidataId"],
        geonameId: json["geonameId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "isoName": isoName,
        "order": order,
        "adminLevel": adminLevel,
        "isoCode": isoCode,
        "wikidataId": wikidataId,
        "geonameId": geonameId,
      };
}
