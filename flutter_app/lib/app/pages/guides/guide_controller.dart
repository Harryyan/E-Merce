import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/pages/guides/guide_presenter.dart';
import 'package:flutter_app/app/widgets/guide.dart';
import 'package:flutter_app/domain/entity/GuideInfo.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GuideController extends Controller {
  int currentPage;
  GuidePresenter presenter;

  GuideController(guideRepo)
      : presenter = GuidePresenter(guideRepo),
        super();

  List<GuideInfo> _items;

  List<GuideInfo> get items => _items;

  @override
  void initController(GlobalKey<State<StatefulWidget>> key) {
    super.initController(key);

    presenter.getGuideInfo();
  }

  @override
  void initListeners() {
    presenter.getGuideOnNext = (List<GuideInfo> items) {
      _items = items;

      refreshUI();
    };

    presenter.getGuideOnError = (e) {
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));

      _items = null;
      refreshUI();
    };
  }

  void getGuideInfo() => presenter.getGuideInfo();

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
