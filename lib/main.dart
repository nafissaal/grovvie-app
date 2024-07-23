import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:grovvie/application_state.dart';
import 'package:grovvie/firebase_options.dart';
import 'package:grovvie/navigation/navigation_helper.dart';
import 'package:grovvie/theme/theme.dart';
import 'package:grovvie/theme/util.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  NavigationHelper.instance;

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, 'Noto Sans', 'Comfortaa');

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Grovv App',
      theme: theme.light(),
      routerConfig: NavigationHelper.router,
      localizationsDelegates: [
        FirebaseUILocalizations.withDefaultOverrides(const IdLocalizations()),
        FirebaseUILocalizations.delegate,
      ],
    );
  }
}


