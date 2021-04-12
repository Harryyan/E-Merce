import 'package:flutter/services.dart';
import 'package:flutter_app/app/pages/guides/guide_presenter.dart';
import 'package:flutter_app/domain/entity/GuideInfo.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GuideController extends Controller {
  int currentPage;
  final GuidePresenter presenter;

  GuideController(guideRepo)
      : presenter = GuidePresenter(guideRepo),
        super();

  List<GuideInfo> items;

  void getAll() async {
    items = await presenter.getGuideInfo();
    print(items);
  }

  @override
  void initListeners() {
    getAll();
  }

  @override
  void onInitState() {
    // ViewDidLoad / OnCreate
    super.onInitState();
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
    super.onResumed();
  }

  @override
  void onDisposed() {
    // TODO: implement onDisposed
    super.onDisposed();
  }

  @override
  void onDeactivated() {
    // TODO: implement onDeactivated
    super.onDeactivated();
  }
}
