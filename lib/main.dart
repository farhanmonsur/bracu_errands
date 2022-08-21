import 'dart:async';

import 'package:bracu_errands/src/respository/utils/logger.dart';
import 'package:bracu_errands/src/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:bracu_errands/bootstrap.dart';
import 'package:injectable/injectable.dart';

import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await FlutterConfig.loadEnvVariables();
  logger.d(FlutterConfig.get('API_URL'), 'API URL');

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await bootstrap(
    () => App(),
  );
}
