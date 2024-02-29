class JadwalSholat {
  JadwalSholat({
    required this.coordinate,
    required this.id,
    required this.name,
    required this.slug,
    required this.provinceId,
    required this.province,
    required this.prayers,
  });
  late final Coordinate coordinate;
  late final String id;
  late final String name;
  late final String slug;
  late final String provinceId;
  late final Province province;
  late final List<Prayers> prayers;

  JadwalSholat.fromJson(Map<String, dynamic> json) {
    coordinate = Coordinate.fromJson(json['coordinate']);
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    provinceId = json['provinceId'];
    province = Province.fromJson(json['province']);
    prayers =
        List.from(json['prayers']).map((e) => Prayers.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['coordinate'] = coordinate.toJson();
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['provinceId'] = provinceId;
    _data['province'] = province.toJson();
    _data['prayers'] = prayers.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Coordinate {
  Coordinate({
    required this.latitude,
    required this.longitude,
  });
  late final double latitude;
  late final double longitude;

  Coordinate.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    return _data;
  }
}

class Province {
  Province({
    required this.id,
    required this.name,
    required this.slug,
  });
  late final String id;
  late final String name;
  late final String slug;

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    return _data;
  }
}

class Prayers {
  Prayers({
    required this.time,
    required this.id,
    required this.date,
    required this.cityId,
  });
  late final Time time;
  late final String id;
  late final String date;
  late final String cityId;

  Prayers.fromJson(Map<String, dynamic> json) {
    time = Time.fromJson(json['time']);
    id = json['id'];
    date = json['date'];
    cityId = json['cityId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['time'] = time.toJson();
    _data['id'] = id;
    _data['date'] = date;
    _data['cityId'] = cityId;
    return _data;
  }
}

class Time {
  Time({
    required this.imsak,
    required this.subuh,
    required this.terbit,
    required this.dhuha,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
  });
  late final String imsak;
  late final String subuh;
  late final String terbit;
  late final String dhuha;
  late final String dzuhur;
  late final String ashar;
  late final String maghrib;
  late final String isya;

  Time.fromJson(Map<String, dynamic> json) {
    imsak = json['imsak'];
    subuh = json['subuh'];
    terbit = json['terbit'];
    dhuha = json['dhuha'];
    dzuhur = json['dzuhur'];
    ashar = json['ashar'];
    maghrib = json['maghrib'];
    isya = json['isya'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imsak'] = imsak;
    _data['subuh'] = subuh;
    _data['terbit'] = terbit;
    _data['dhuha'] = dhuha;
    _data['dzuhur'] = dzuhur;
    _data['ashar'] = ashar;
    _data['maghrib'] = maghrib;
    _data['isya'] = isya;
    return _data;
  }
}
