import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

extension CacheForExtension on AutoDisposeRef<Object?> {
  /// [duration] 동안 provider를 살아있게 유지합니다.
  void cacheFor(Duration duration) {
    // 상태가 파괴되는 것을 즉시 방지합니다.
    final link = keepAlive();
    // 기간이 경과하면 자동 폐기를 다시 활성화합니다.
    final timer = Timer(duration, link.close);

    // 선택 사항: provider가 다시 계산될 때(예: ref.watch 사용),
    // 보류 중인 타이머를 취소합니다.
    onDispose(timer.cancel);
  }
}

final logger = Logger(
  printer: PrettyPrinter(
      methodCount: 1, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
  ),
);
