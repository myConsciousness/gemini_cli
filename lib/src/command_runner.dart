// Copyright 2024 Shinya Kato. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 🎯 Dart imports:
import 'dart:async';
import 'dart:io';

// 📦 Package imports:
import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli_launcher/cli_launcher.dart';
import 'package:cli_util/cli_logging.dart';

// 🌎 Project imports:
import './version.g.dart';
import 'command/gen_command.dart';
import 'logger.dart';

/// A class that can run Gemini commands.
///
/// To run a command, do:
///
/// ```dart
/// final gemini = GeminiCommandRunner();
///
/// await gemini.run(['gen -p="Write a story about a magic backpack."']);
/// ```
class GeminiCommandRunner extends CommandRunner<void> {
  GeminiCommandRunner()
      : super(
          'gemini',
          'Command line tool to provide generative AI using Google Gemini LLM.',
        ) {
    argParser
      ..addOption(
        'api-key',
        help:
            'API key to use Google Gemini; see https://ai.google.dev/tutorials/setup.',
        defaultsTo: Platform.environment['GEMINI_API_KEY'],
      )
      ..addFlag(
        'verbose',
        negatable: false,
        help: 'Enable verbose logging.',
      );

    for (final command in [GenCommand()]) {
      addCommand(command);
    }
  }

  @override
  Future<void> runCommand(ArgResults topLevelResults) async =>
      await super.runCommand(topLevelResults);
}

FutureOr<void> entryPoint(
  List<String> args,
  LaunchContext context,
) async {
  if (args.contains('--version') || args.contains('-v')) {
    final logger = GeminiLogger(Logger.standard());

    logger.log(version);

    return;
  }

  try {
    await GeminiCommandRunner().run(args);
  } on UsageException catch (e) {
    stderr.writeln(e.toString());
    exitCode = 1;
  } catch (err) {
    exitCode = 1;
    rethrow;
  }
}
