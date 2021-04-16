import 'dart:developer';
import 'package:flutter_app/data/constants/values.dart';
import 'package:flutter_app/domain/entity/GuideInfo.dart';
import 'package:flutter_app/domain/repository/GuideRepository.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show json;

class DataGuideRepository extends GuideRepository {
  @override
  Future<List<GuideInfo>> getAll() async {
    final String rawData = await rootBundle.loadString(welcomeFilePath);
    final data = await json.decode(rawData);
    List<GuideInfo> items = [];

    if (data['items'] != null) {
      data['items'].forEach((item) => items.add(new GuideInfo.fromJson(item)));
    }

    return items;
  }
}
