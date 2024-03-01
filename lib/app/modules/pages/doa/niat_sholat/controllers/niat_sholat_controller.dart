import 'dart:convert';

import 'package:alquran/app/data/models/niat_sholat.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NiatSholatController extends GetxController {
  List<NiatSholat> allNiatSholat = [];
  Future<List<NiatSholat>> getNiatSholat() async {
    Uri url = Uri.parse('https://apimuslimify.vercel.app/api/v2/niatshalat');
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      allNiatSholat = data.map((e) => NiatSholat.fromJson(e)).toList();
      return allNiatSholat;
    }
  }
}
