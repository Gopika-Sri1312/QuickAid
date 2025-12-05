import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/first_aid.dart';

class LocalDB {
  List<FirstAidItem> items = [];

  Future<void> init() async {
    final data = await rootBundle.loadString('assets/first_aid.json');
    final List<dynamic> jsonList = json.decode(data);
    items = jsonList.map((e) => FirstAidItem.fromMap(e)).toList();
  }

  List<FirstAidItem> search(String query) {
    return items
        .where((item) =>
            item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
