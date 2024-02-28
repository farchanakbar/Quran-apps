import 'dart:convert';

import 'package:alquran/app/data/db/bookmark.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  List<Surah> allSurah = [];

  DatabaseManager database = DatabaseManager.instance;

  void deleteBookmark(int id) async {
    Database db = await database.db;
    await db.delete('bookmark', where: 'id = $id');
    update();
    Get.back();
    Get.snackbar('Berhasil Dihapus', 'Bookmark berhasil dihapus');
  }

  Future<List<Map<String, dynamic>>> getBookmark() async {
    Database db = await database.db;
    List<Map<String, dynamic>> allBookmark =
        await db.query('bookmark', where: 'last_read = 0');
    return allBookmark;
  }

  Future<Map<String, dynamic>?> getLastRead() async {
    Database db = await database.db;
    List<Map<String, dynamic>> dataLastRead =
        await db.query('bookmark', where: 'last_read = 1');
    if (dataLastRead.isEmpty) {
      return null;
    } else {
      return dataLastRead.first;
    }
  }

  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah');
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      allSurah = data.map((e) => Surah.fromJson(e)).toList();
      return allSurah;
    }
  }
}
