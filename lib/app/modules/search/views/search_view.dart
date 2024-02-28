import 'package:alquran/app/modules/search/controllers/search_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchView extends GetView<SearchSurahController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
