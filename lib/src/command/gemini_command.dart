// Copyright 2024 Shinya Kato. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:args/command_runner.dart';
import 'package:cli_util/cli_logging.dart';

// 🌎 Project imports:
import '../auth.dart';
import '../logger.dart';

abstract class GeminiCommand extends Command<void> {
  GeminiCommand();

  /// The logger
  late final logger = GeminiLogger(globalResults!['verbose']! as bool
      ? Logger.verbose()
      : Logger.standard());

  late final auth = Auth(globalResults!['api-key']);
}
