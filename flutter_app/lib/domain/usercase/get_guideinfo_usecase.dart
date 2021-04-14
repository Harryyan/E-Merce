import 'dart:async';

import 'package:flutter_app/domain/entity/GuideInfo.dart';
import 'package:flutter_app/domain/repository/GuideRepository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetGuideUseCase extends UseCase<GuideUseCaseResponse, Object> {
  final GuideRepository guideRepository;

  GetGuideUseCase(this.guideRepository);

  @override
  Future<Stream<GuideUseCaseResponse>> buildUseCaseStream(
      Object params) async {
    final controller = StreamController<GuideUseCaseResponse>();
    try {
      final guideItems = await guideRepository.getAll();
      // Trigger .OnNext
      controller.add(GuideUseCaseResponse(guideItems));
      logger.finest('GetUserUseCase successful.');
      controller.close();
    } catch (e) {
      logger.severe('GetUserUseCase unsuccessful.');
      // Trigger .onError
      controller.addError(e);
    }
    return controller.stream;
  }
}

/// Create DTO folder later
class GuideUseCaseResponse {
  final List<GuideInfo> items;

  GuideUseCaseResponse(this.items);
}
