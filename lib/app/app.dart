import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/home/home.dart';
import 'package:flutter_todos/l10n/l10n.dart';
import 'package:flutter_todos/theme/theme.dart';
import 'package:todos_repository/todos_repository.dart';
// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

// Generated in previous step 
import 'package:flutter_todos/amplifyconfiguration.dart';
class App extends StatelessWidget {
  const App({Key? key, required this.todosRepository}) : super(key: key);

  final TodosRepository todosRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: todosRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterTodosTheme.light,
      darkTheme: FlutterTodosTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
