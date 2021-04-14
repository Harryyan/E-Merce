import 'package:flutter_app/domain/entity/GuideInfo.dart';
import 'package:flutter_app/domain/repository/GuideRepository.dart';
import 'package:flutter_app/domain/usercase/get_guideinfo_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GuidePresenter extends Presenter {
  Function getUserOnNext;
  Function getUserOnComplete;
  Function getUserOnError;

  final GetGuideUseCase guideInfo;

  GuidePresenter(guideRepo) : guideInfo = GetGuideUseCase(guideRepo);
  
  void getGuideInfo() {
    guideInfo.execute(observer)
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
    assert(presenter.getUserOnComplete != null);
    presenter.getUserOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.getUserOnError != null);
    presenter.getUserOnError(e);
  }

  @override
  void onNext(response) {
    assert(presenter.getUserOnNext != null);
    presenter.getUserOnNext(response.user);
  }
}
