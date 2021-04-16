import 'package:flutter_app/domain/usercase/get_guideinfo_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GuidePresenter extends Presenter {
  Function getGuideOnNext;
  Function getGuideOnComplete;
  Function getGuideOnError;

  final GetGuideUseCase guideInfo;

  GuidePresenter(guideRepo) : guideInfo = GetGuideUseCase(guideRepo);

  void getGuideInfo() {
    guideInfo.execute(_GuideUseCaseObserver(this), null);

    print("ff");
  }

  @override
  void dispose() {
    guideInfo.dispose();
  }
}

class _GuideUseCaseObserver extends Observer<GuideUseCaseResponse> {
  final GuidePresenter presenter;

  _GuideUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getGuideOnComplete != null);
    presenter.getGuideOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.getGuideOnError != null);
    presenter.getGuideOnError(e);
  }

  @override
  void onNext(response) {
    assert(presenter.getGuideOnNext != null);
    presenter.getGuideOnNext(response.items);
  }
}
