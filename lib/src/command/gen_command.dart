// Copyright 2024 Shinya Kato. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:google_generative_ai/google_generative_ai.dart';

// 🌎 Project imports:
import 'package:gemini_cli/src/command/gemini_command.dart';
import 'package:gemini_cli/src/runner/gemini_runner.dart';

class GenCommand extends GeminiCommand {
  GenCommand() {
    argParser.addOption(
      'p',
      help: 'Prompt.',
      defaultsTo: '',
    );
  }

  @override
  final String name = 'gen';

  @override
  final String description = 'Generate contents based on prompt.';

  @override
  final String invocation = 'gemini gen [p]';

  @override
  Future<void> run() async => await Gemini(logger, action: () async {
        final model = GenerativeModel(model: 'gemini-pro', apiKey: auth.apiKey);

        return await model.generateContent([Content.text(argResults!['p']!)]);
      }).run();
}
