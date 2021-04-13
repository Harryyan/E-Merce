import 'dart:async';

import 'package:flutter_app/domain/entity/GuideInfo.dart';
import 'package:flutter_app/domain/repository/GuideRepository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetGuideUseCase extends UseCase<GetGuideUseCaseResponse, Object> {
  final GuideRepository guideRepository;

  GetGuideUseCase(this.guideRepository);

  @override
  Future<Stream<GetGuideUseCaseResponse>> buildUseCaseStream(
      Object params) async {
    final controller = StreamController<GetGuideUseCaseResponse>();
    try {
      final guideItems = await guideRepository.getAll();
      // Trigger .OnNext
      controller.add(GetGuideUseCaseResponse(guideItems));
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

/// Wrapping response inside an object makes it easier to change later
class GetGuideUseCaseResponse {
  final List<GuideInfo> items;

  GetGuideUseCaseResponse(this.items);
}
