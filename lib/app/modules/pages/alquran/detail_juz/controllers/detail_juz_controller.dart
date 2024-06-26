import 'dart:convert';
import 'package:alquran/app/constants/color.dart';
import 'package:alquran/app/data/db/bookmark.dart';
import 'package:just_audio/just_audio.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../data/models/juz.dart';

class DetailJuzController extends GetxController {
  final player = AudioPlayer();
  Verse? lastVerse;
  AutoScrollController autoScrollC = AutoScrollController();

  DatabaseManager database = DatabaseManager.instance;

  Future<void> addBookmark(
    bool lastRead,
    int juz,
    Verse ayat,
    int indexAyat,
  ) async {
    Database db = await database.db;

    bool flagExist = false;

    if (lastRead == true) {
      await db.delete('bookmark', where: 'last_read = 1');
    } else {
      List checkData = await db.query('bookmark',
          columns: [
            'surah',
            'number_surah',
            'ayat',
            'juz',
            'via',
            'index_ayat',
            'last_read',
          ],
          where:
              "surah = '$juz' and number_surah = $juz and ayat = ${ayat.number!.inSurah} and juz = ${ayat.meta!.juz} and via = 'juz' and index_ayat = $indexAyat and last_read = 0");
      if (checkData.isNotEmpty) {
        flagExist = true;
      }
    }

    if (flagExist == false) {
      await db.insert('bookmark', {
        'surah': '$juz',
        'number_surah': '$juz',
        'ayat': ayat.number!.inSurah,
        'juz': ayat.meta!.juz,
        'via': 'juz',
        'index_ayat': indexAyat,
        'last_read': lastRead == true ? 1 : 0
      });

      Get.back();
      Get.snackbar(
        'Berhasil',
        'Berhasil Menambahkan Penanda Bacaan',
        colorText: colorEmpat,
      );
    } else {
      Get.back();
      Get.snackbar(
        'Terjadi Kesalahan',
        'Penanda Bacaan Sudah Ada',
        colorText: colorEmpat,
      );
    }

    var data = await db.query('bookmark');
    print(data);
  }

  Future<Juz> getAllJuz(dynamic id) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/juz/$id');
    var res = await http.get(url);

    Map<String, dynamic> data = json.decode(res.body)['data'];

    return Juz.fromJson(data);
  }

  void audioPlayers(Verse? ayat) async {
    if (ayat?.audio?.primary != null) {
      try {
        ayat?.isLoading = true;
        lastVerse ??= ayat;
        lastVerse!.kondisiAudio = 'stop';
        lastVerse = ayat;
        lastVerse!.kondisiAudio = 'stop';
        update();
        await player.stop();
        await player.setUrl(ayat!.audio!.primary!);
        ayat.kondisiAudio = 'playing';
        update();
        await player.play();
        ayat.kondisiAudio = 'stop';
        await player.stop();
        ayat.isLoading = false;
        update();
      } on PlayerException catch (e) {
        // iOS/macOS: maps to NSError.code
        // Android: maps to ExoPlayerException.type
        // Web: maps to MediaError.code
        // Linux/Windows: maps to PlayerErrorCode.index
        print("Error code: ${e.code}");
        // iOS/macOS: maps to NSError.localizedDescription
        // Android: maps to ExoPlaybackException.getMessage()
        // Web/Linux: a generic message
        // Windows: MediaPlayerError.message
        print("Error message: ${e.message}");
      } on PlayerInterruptedException catch (e) {
        // This call was interrupted since another audio source was loaded or the
        // player was stopped or disposed before this audio source could complete
        // loading.
        ayat?.isLoading = false;
        print("Connection aborted: ${e.message}");
      } catch (e) {
        print('An error occured: $e');
      }
    } else {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'URL audio tidak valid',
      );
    }
  }

  void pauseAudio(Verse ayat) async {
    try {
      await player.pause();
      ayat.kondisiAudio = 'pause';
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Error message ${e.message}',
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: "Connection aborted: ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'An error occured: $e',
      );
    }
  }

  void resumeAudio(Verse ayat) async {
    try {
      ayat.kondisiAudio = 'playing';
      update();
      await player.play();
      ayat.kondisiAudio = 'stop';
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Error message ${e.message}',
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: "Connection aborted: ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'An error occured: $e',
      );
    }
  }

  void stopAudio(Verse ayat) async {
    try {
      await player.stop();
      ayat.kondisiAudio = 'stop';
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Error message ${e.message}',
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: "Connection aborted: ${e.message}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'An error occured: $e',
      );
    }
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
