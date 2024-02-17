// Copyright 2024 Shinya Kato. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:async';
import 'dart:io';

// 📦 Package imports:
import 'package:cli_util/cli_logging.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

// 🌎 Project imports:
import '../logger.dart';

class Gemini extends _Gemini {
  Gemini(
    Logger? logger, {
    required this.action,
  }) : logger = (logger ?? Logger.standard()).toGeminiLogger();

  @override
  final GeminiLogger logger;

  /// The Gemini action.
  final Future<GenerateContentResponse> Function() action;

  @override
  Future<void> run() async {
    try {
      final response = await action.call();

      logger.success(response.text ?? '');
    } catch (e) {
      logger.error(e.toString());

      exitCode = 1;
    }
  }
}

abstract class _Gemini {
  GeminiLogger get logger;

  Future<void> run();
}
