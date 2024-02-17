// Copyright 2024 Shinya Kato. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// 📦 Package imports:
import 'package:cli_launcher/cli_launcher.dart' as cli;

// 🌎 Project imports:
import 'package:gemini_cli/gemini_cli.dart';

void main(List<String> args) => cli.launchExecutable(
      args,
      cli.LaunchConfig(
        name: cli.ExecutableName('gemini', package: 'gemini_cli'),
        launchFromSelf: false,
        entrypoint: entryPoint,
      ),
    );
