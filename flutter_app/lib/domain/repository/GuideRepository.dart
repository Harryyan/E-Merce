import 'package:flutter_app/domain/entity/GuideInfo.dart';

abstract class GuideRepository {
  Future<List<GuideInfo>> getAll();
}