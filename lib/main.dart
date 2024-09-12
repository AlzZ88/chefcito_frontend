import 'package:frontend_template/shared/providers/my_auth_provider.dart';
import 'package:frontend_template/shared/routers/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'feature_1/providers/my_provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyAuthProvider(),
        ),
      ],
      child: Consumer<MyAuthProvider>(
        builder: (context, authProvider, child) {
          final appRouter = AppRouter(authProvider: authProvider);
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Project Template',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
              useMaterial3: true,
            ),
            routerConfig: appRouter.router,
          );
        },
      ),
    );
  }
}
