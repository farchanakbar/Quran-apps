import 'dart:convert';

import 'package:alquran/app/data/models/doa_harian.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class DoaController extends GetxController {
  List<DoaHarian> allDoa = [];
  Future<List<DoaHarian>> getAllDoa() async {
    Uri url = Uri.parse('https://doa-doa-api-ahmadramadhan.fly.dev/api');
    var res = await http.get(url);

    List? data = json.decode(res.body);

    if (data == null || data.isEmpty) {
      return [];
    } else {
      allDoa = data.map((e) => DoaHarian.fromJson(e)).toList();
      return allDoa;
    }
  }
}
