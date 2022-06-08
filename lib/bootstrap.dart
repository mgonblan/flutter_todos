import 'dart:async';
import 'dart:developer';

import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
// Generated in previous step
import 'package:flutter_todos/amplifyconfiguration.dart';
import 'package:flutter_todos/app/app.dart';
import 'package:flutter_todos/app/app_bloc_observer.dart';
import 'package:todos_api/todos_api.dart';
import 'package:todos_repository/todos_repository.dart';

void bootstrap({required TodosApi todosApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final todosRepository = TodosRepository(todosApi: todosApi);

  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          App(todosRepository: todosRepository),
        ),
        blocObserver: AppBlocObserver(),
      );
      await BlocOverrides.runZoned(_configureAmplify);
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

Future<void> _configureAmplify() async {
  // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
  final analyticsPlugin = AmplifyAnalyticsPinpoint();
  final authPlugin = AmplifyAuthCognito();
  await Amplify.addPlugins([authPlugin, analyticsPlugin,AmplifyAuthCognito()]);

  // Once Plugins are added, configure Amplify
  // Note: Amplify can only be configured once.
  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    if (kDebugMode) {
      print(
          'Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
    }
  }
}
