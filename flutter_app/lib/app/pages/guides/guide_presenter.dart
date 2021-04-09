import 'package:flutter_app/domain/entity/GuideInfo.dart';
import 'package:flutter_app/domain/repository/GuideRepository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GuidePresenter extends Presenter {
  final GuideRepository repo;
  List<GuideInfo> items;

  GuidePresenter(guideRepo) : repo = guideRepo;

  Future<List<GuideInfo>> getGuideInfo() async {
    items = await repo.getAll();
    return items;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
