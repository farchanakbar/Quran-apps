import 'dart:convert';

import 'package:alquran/app/data/models/asmaul_husna.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class AsmaulHusnaController extends GetxController {
  List<AsmaulHusna> allAsmaulHusna = [];
  Future<List<AsmaulHusna>> getaAsmaulHusna() async {
    Uri url = Uri.parse('https://asmaul-husna-api.vercel.app/api/all');
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      allAsmaulHusna = data.map((e) => AsmaulHusna.fromJson(e)).toList();
      return allAsmaulHusna;
    }
  }
}
